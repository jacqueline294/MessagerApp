//
//  Message.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-14.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
 // Data for messaging i.e knowing who is writting the message is it from the sender(currentuser) or the reciver who is the ( chosen Person)
struct Message: Identifiable,Codable,Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timeStamp: Timestamp
    
    var user:User?
     
    var id: String { return messageId ?? UUID().uuidString
    }
    var chatPartnerId: String{
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId // to find out who we are chatting with
    }
    // checks if message is from current user
    var  isFromCurrentUser: Bool{
        return fromId == Auth.auth().currentUser?.uid
    }
}
