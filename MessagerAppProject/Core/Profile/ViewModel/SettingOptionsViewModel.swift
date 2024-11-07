//
//  SettingOptionsViewModel.swift
//  MessagerAppProject
//
//  Created by jacqueline Ngigi on 2024-11-07.
//

import SwiftUI

enum SettingOptionsViewModel:Int,CaseIterable,Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var title:String {
        switch self {
        case .darkMode:
            return "Dark Mode"
        case .activeStatus:
            return "Active Status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy"
        case .notifications:
            return "Notifications"
        }
    }
     var imageName:String {
        switch self {
        case .darkMode:
            return "moon.circle.fil"
        case .activeStatus:
            return "message.badge.circle.fill"
        case .accessibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.circle.fill"
        }
    }
    var imageBackgroundColor:Color {
        switch self {
        case .darkMode:
            return .cyan
        case .activeStatus:
            return .green
        case .accessibility:
            return .black
        case .privacy:
            return .blue
        case.notifications:
            return .purple
        }
    }
    
    var id: Int {return self.rawValue }
}
