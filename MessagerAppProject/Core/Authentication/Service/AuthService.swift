//
//  AuthService.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import Foundation
import Firebase
import FirebaseAuth

// AuthService will be used to  house the code to communicate with firebase  like login a user.

class AuthService {
    // keep track weather the user is logged in or not
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    
    init () {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email , password: password)
            self.userSession = result.user
            
        }catch{
            print("DEBUG:Fail to sign in user with error: \(error.localizedDescription)")
            
        }
        
    }
    func createUser(withEmail email: String, password: String,fullname: String)async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("DEBUG:Fail to creat user with error: \(error.localizedDescription)")
            
        }
    }
    func signOut(){
        do{
            try Auth.auth().signOut() // signout from the backend
            self.userSession = nil// updates the routing logic
        }catch{
            print("DEBUG: Failed to sign out with error : \(error.localizedDescription)")
        }
    }
}


