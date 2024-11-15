//
//  User.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//


// user Data
import Foundation
import FirebaseFirestore


struct User: Codable, Identifiable,Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    let profileImageUrl: String?
    
    var id: String {return uid ?? UUID().uuidString
    }
}
extension User {
    static let MOCK_USER = User(fullname: "Jacqueline Ngigi", email: "jacqueline@ngigi.com", profileImageUrl: "galaxy")
    
}
