//
//  UserService.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-12.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

// this is to upload the current User data.

class UserService{
    
    @Published var currentUser:User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser()async throws{
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        
        
    }
    // fetch all users
  
    static func fetchAllUser()async throws->[User]{
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
        
    }
}
