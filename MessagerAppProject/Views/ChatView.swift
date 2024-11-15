//
//  ChatView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import SwiftUI

struct ChatView: View {
    @StateObject private  var viewModel : ChatViewModel
    let user:User
    
    init(user: User) {
            self.user = user
            _viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
        }
    
    var body: some View {
        
        VStack {
            //header
            ScrollView{
                VStack{
                    CircularProfileImageView(user: user, size: .xlarge)
                    
                    VStack(spacing: 4){
                        Text(user.fullname)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Messanger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            
                    }
                }
                //message view
                ForEach(viewModel.messages) { message in
                                            ChatMessageCell(message: message)
                                                .id(message.id)
                                        }
            }
            //message input view
            Spacer()
            
            ZStack(alignment: . trailing){
                TextField("Message", text: $viewModel.messageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing,40)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                
                Button(action: viewModel.sendMessage) {
                    Text("Send")
                .fontWeight(.semibold)
                               
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
