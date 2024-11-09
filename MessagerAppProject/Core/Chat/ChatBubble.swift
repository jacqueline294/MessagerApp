//
//  ChatBubble.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-09.
//

import SwiftUI

// to sha the chatbubble  with a round shape and a tip  ant he end so if its from the sender its bottom right if it from the reciver it on the bottom left

struct ChatBubble: Shape {
    let isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [
            .topLeft,
            .topRight,
            isFromCurrentUser ? .bottomLeft : .bottomRight
        ],
            cornerRadii: .init(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
    
}

#Preview {
    ChatBubble(isFromCurrentUser: true )
}
