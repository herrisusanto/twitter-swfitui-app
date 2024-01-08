//
//  Tweet.swift
//  Twitter SwiftUI
//
//  Created by loratech on 08/01/24.
//

import FirebaseFirestore
import Firebase


struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}

class MockTweet {
    static var tweet: Tweet = Tweet(id: NSUUID().uuidString, caption: "Hi, good morning!", timestamp: Timestamp(seconds: 1704682756, nanoseconds: 962908000), uid: "PgQTdZubr6Qtgixdurq7RsJfUIk1", likes: 0, user: nil)
    
    static var tweets: [Tweet] =
    [Tweet(id: NSUUID().uuidString, caption: "Hi, good morning!", timestamp: Timestamp(seconds: 1704682756, nanoseconds: 962908000), uid: "PgQTdZubr6Qtgixdurq7RsJfUIk1", likes: 0, user: nil),
     Tweet(id: NSUUID().uuidString, caption: "Hi, good morning!", timestamp: Timestamp(seconds: 1704682756, nanoseconds: 962908000), uid: "PgQTdZubr6Qtgixdurq7RsJfUIk1", likes: 0, user: nil)]
}

