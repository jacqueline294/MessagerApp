//
//  AuthService.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

// AuthService will be used to  house the code to communicate with firebase to authenicate a user i.e login a user, create a user or logout a user.

class AuthService {
    // keep track weather the user is logged in or not
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    
    init () {
        self.userSession = Auth.auth().currentUser
        Task{ await loadCurrentUserData()}
            
        }
    private func loadCurrentUserData()async{
        do{
            try await UserService.shared.fetchCurrentUser()
            
        }catch{print("Failed to fetch current user data: \(error.localizedDescription)")
            
        }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws-> FirebaseAuth.User {
        do{
            let result = try await Auth.auth().signIn(withEmail: email , password: password)
            self.userSession = result.user
            try await loadCurrentUserData()
            return result.user
        }catch{
            print("Login failed: \(error.localizedDescription)")
            throw error
            
        }
        
    }
    @MainActor
    func createUser(withEmail email: String, password: String,fullname: String)async throws-> FirebaseAuth.User {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            try await loadCurrentUserData()
            return result.user
        }catch{
            print("Create user failed: \(error.localizedDescription)")
            throw error
        }
    }
    func signOut()async throws{
        do{
            try Auth.auth().signOut() // signout from the backend
            self.userSession = nil// updates the routing logic
            UserService.shared.currentUser = nil
        }catch{
            print("DEBUG: Failed to sign out with error : \(error.localizedDescription)")
            throw error
        }
    }
    private func uploadUserData(email:String,fullname:String,id:String)async throws{
        let user = User(fullname: fullname, email: email,  profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user)else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
}
    



