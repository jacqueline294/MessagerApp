//
//  ChatViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-14.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Combine

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = [] // Array to store messages
    @Published var messageText = "" // Holds the text input for a new message
    
    let user: User // Chat partner
    private var cancellables = Set<AnyCancellable>()
    
    init(user: User) {
        self.user = user
        fetchMessages() // Fetch initial messages
    }
    
    // Function to send a message to Firestore
    func sendMessage() {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        let toId = user.id
        let timestamp = Timestamp(date: Date())
        
        //  to Create a new Message object
        let message = Message(
            fromId: currentUserId,
            toId: toId,
            messageText: messageText,
            timeStamp: timestamp
        )
        
        // Save the message to Firestore for both sender and receiver
        saveMessage(message, fromId: currentUserId, toId: toId)
        saveMessage(message, fromId: toId, toId: currentUserId)
        
        // Clear the message input after sending
        messageText = ""
    }
    
    private func saveMessage(_ message: Message, fromId: String, toId: String) {
        do {
            // Save message to Firestore in a collection structure
            try Firestore.firestore()
                .collection("messages")
                .document(fromId)
                .collection(toId)
                .document() // Auto-generate document ID
                .setData(from: message)
        } catch {
            print("Error saving message: \(error.localizedDescription)")
        }
    }
    
    // Function to fetch messages from Firestore in real-time
    private func fetchMessages() {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore()
            .collection("messages")
            .document(currentUserId)
            .collection(user.id)
            .order(by: "timestamp")
            .addSnapshotListener { [weak self] snapshot, error in
                if let error = error {
                    print("Error fetching messages: \(error.localizedDescription)")
                    return
                }
                
                self?.messages = snapshot?.documents.compactMap { document in
                    try? document.data(as: Message.self)
                } ?? []
            }
    }
}
