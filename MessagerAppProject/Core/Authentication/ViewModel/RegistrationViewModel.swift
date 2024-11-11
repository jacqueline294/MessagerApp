//
//  RegistrationViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws{
        try await AuthService().createUser(withEmail:email,password:password,fullname:fullname)
        
    }
    
}
