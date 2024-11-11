//
//  LoginViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    // function to log in a user 
    func login()async throws{
        try await AuthService().login(withEmail:email,password:password)
    }
}
