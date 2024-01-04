//
//  SideMenuViewModel.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case bookmarks
    case lists
    case spaces
    case monetization
    case logout
    
    var title: String {
        switch self {
        case .profile:
            return "Profile"
        case .lists:
            return "Lists"
        case .bookmarks:
            return "Bookmarks"
        case .spaces:
            return "Spaces"
        case .monetization:
            return "Monetization"
        case .logout:
            return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile:
            return "person"
        case .lists:
            return "list.bullet"
        case .bookmarks:
            return "bookmark"
        case .spaces:
            return "mic"
        case .monetization:
            return "dollarsign.square"
        case .logout:
            return "arrow.left.square"
        }
    }
}
