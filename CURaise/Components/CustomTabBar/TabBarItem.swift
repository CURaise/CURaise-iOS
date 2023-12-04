//
//  TabBarItem.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case explore, favorites, profile, messages
    
    var iconName: String {
        switch self {
        case .explore: return "safari"
        case .favorites: return "heart"
        case .profile: return "person"
        case .messages: return "message"
        }
    }
    
    var title: String {
        switch self {
        case .explore: return "Explore"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .messages: return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .explore: return Color.blue
        case .favorites: return Color.red
        case .profile: return Color.green
        case .messages: return Color.orange
        }
    }
}
