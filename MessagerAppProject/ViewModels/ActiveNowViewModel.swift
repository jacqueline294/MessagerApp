//
//  ActiveNowViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-14.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class ActiveNowViewModel: ObservableObject {
    @Published var activeUsers: [User] = []
    
    init() {
        fetchActiveUsers()
    }
    
    func fetchActiveUsers() {
        Firestore.firestore().collection("users")
                    .whereField("isActive", isEqualTo: true) // Filter for active users
                    .addSnapshotListener { [weak self] snapshot, error in
                        if let error = error {
                            print("Error fetching active users: \(error)")
                            return
                        }
                        
                        self?.activeUsers = snapshot?.documents.compactMap { document in
                            try? document.data(as: User.self)
                        } ?? []
                    }
    }
}
