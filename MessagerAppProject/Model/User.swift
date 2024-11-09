//
//  User.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//


// user Data
import Foundation
struct User: Codable, Identifiable,Hashable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    let profileImageUrl: String?
}
extension User {
    static let MOCK_USER = User(fullname: "Jacqueline Ngigi", email: "jacqueline@ngigi.com", profileImageUrl: "galaxy")
    
}
