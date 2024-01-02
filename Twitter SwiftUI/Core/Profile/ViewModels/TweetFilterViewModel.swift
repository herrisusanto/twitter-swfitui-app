//
//  TweetFilterViewModel.swift
//  Twitter SwiftUI
//
//  Created by loratech on 02/01/24.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case.tweets:
            return "Tweets"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
}
