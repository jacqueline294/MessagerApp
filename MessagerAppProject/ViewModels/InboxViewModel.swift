//
//  InboxViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-12.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>() 
    
    init() {
        setUpSubscriber()
    }
    
    private func setUpSubscriber() {
        UserService.shared.$currentUser
            .sink { [weak self] user in
                self?.currentUser = user
            }
            .store(in: &cancellables)
    }
}
