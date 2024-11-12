//
//  ContentView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-06.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        // this will check if there is a user logged in if so the user will end up in the InboxView but if they are not the user will be send to the loginView
        Group{
            if viewModel.userSesstion != nil{
                InboxView()
            }else {
                LoginView()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
