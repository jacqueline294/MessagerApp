//
//  ChatMessageView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import SwiftUI
import FirebaseCore

struct ChatMessageCell: View {
    
    let message: Message
    
    var body: some View {
        HStack{
            if message.isFromCurrentUser {
                Spacer()
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: message.isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width/1.5,alignment:. trailing)// to constain the message to one side so it doesnt bleed to the other side
            }else{
                HStack(alignment:.bottom, spacing:8){
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("hello to the world I am here, thank you for having me here")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: message.isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width/1.75,alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal,8)
    }
}

#Preview {
    ChatMessageCell( message: Message(
        messageId: "1",
        fromId: "currentUserId",
        toId: "recipientId",
        messageText: "Hello to the world, I am here, thank you for having me here",
        timeStamp: Timestamp()
        
    ))
}
