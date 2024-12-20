//
//  InboxView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showNewMessageView = false
    @StateObject var viewmodel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        return viewmodel.currentUser
    }
    
    var body: some View {
        
            ScrollView{
                ActiveNowView()
                List{
                    ForEach(0..<10, id: \.self){ message in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .onAppear {
            if selectedUser != nil {
            showChat = true
               }
            }
            
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessageView, content:{
                NewMessageView(selectedUser: $selectedUser)
            })
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationLink(value: user) {
                        CircularProfileImageView(user: user, size:.xSmall)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showNewMessageView.toggle()
                        
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width:32 , height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                    
                    
                }
            }
            
        }
    }


#Preview {
    InboxView()
}
