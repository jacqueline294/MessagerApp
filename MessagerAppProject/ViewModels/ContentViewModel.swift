//
//  ContentViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-11.
//

import Firebase
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject{
    @Published var userSesstion:FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscriber()
    }
    private func setupSubscriber(){
        AuthService.shared.$userSession
            .sink { [weak self] userSessionFromAuthService in
            self?.userSesstion = userSessionFromAuthService
            
        }.store(in: &cancellables)
        
    }
}
