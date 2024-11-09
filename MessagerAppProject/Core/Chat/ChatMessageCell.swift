//
//  ChatMessageView.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                Text("Hello World")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }else{
                HStack(alignment:.bottom, spacing:8){
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("hello to the world I am here")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal,8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
