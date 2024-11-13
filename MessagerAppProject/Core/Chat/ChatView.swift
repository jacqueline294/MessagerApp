//
//  ChatView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    let user:User
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
                ForEach(0...15,id :\.self){message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
            }
            //message input view
            Spacer()
            
            ZStack(alignment: . trailing){
                TextField("Message", text: $messageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing,40)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                
                Button{
                    print("Send Message")
                }label: {
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
