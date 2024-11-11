//
//  AuthService.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import Foundation
import Firebase

// AuthService will be used to  house the code to communicate with firebase  like login a user.

class AuthService {
    
    func login(withEmail: String, password: String) async throws {
        
    }
    func createUser(withEmail: String, password: String,fullname: String)async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            print("DEBUG create user: \(result.user.uid)")
            
        }catch{ print("DEBUG:Fail to creat user with error: \(error.localizedDescription)")
            
        }
    }
    
}
