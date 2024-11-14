//
//  NewMessageViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-13.
//

import Foundation
import FirebaseAuth


class NewMessageViewModel: ObservableObject{
    @Published var users = [User]()
    
    init() {
        Task{try await fetchUsers()}
        
    }
    @MainActor
    func fetchUsers()async throws{
        guard let currentUid = Auth.auth().currentUser?.uid else{return}
        let users = try await UserService.fetchAllUser()
        self.users = users.filter({$0.id != currentUid})// to filter the current user from the Users List in NewMessage list
    }
}
