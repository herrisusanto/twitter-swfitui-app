//
//  MainTabViewModel.swift
//  Twitter SwiftUI
//
//  Created by loratech on 09/01/24.
//

import Foundation


enum MainTabViewModel: Int, CaseIterable {
    case home
    case explore
    case notifications
    case messages
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .explore:
            return "Explore"
        case .notifications:
            return "Notifications"
        case .messages:
            return "Messages"
        }
    }
}
