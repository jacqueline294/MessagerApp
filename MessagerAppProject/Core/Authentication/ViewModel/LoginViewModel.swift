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
    
    // function to log in a user by calling the function in AuthService to log in the user
    func login()async throws{
        try await AuthService.shared.login(withEmail: email, password:password)
    }
}
