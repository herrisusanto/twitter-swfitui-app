//
//  User.swift
//  Twitter SwiftUI
//
//  Created by loratech on 06/01/24.
//
import Foundation
import FirebaseFirestoreSwift
import Firebase


struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullName: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
    
}


class MockUser {
    static var user:User = User(id: NSUUID().uuidString, username: "dakota.johnson", fullName: "Dakota Johnson", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/twitter-swiftui-app.appspot.com/o/profile_image%2FB84A92B2-34B0-4F7A-86F1-EF217C03CFBE?alt=media&token=f562af1a-8051-47c5-a505-b245b0fc71e9", email: "dakota.johnson@gmail.com")
    
    static var users:[User] = [
        User(id: NSUUID().uuidString, username: "dakota.johnson", fullName: "Dakota Johnson", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/twitter-swiftui-app.appspot.com/o/profile_image%2FB84A92B2-34B0-4F7A-86F1-EF217C03CFBE?alt=media&token=f562af1a-8051-47c5-a505-b245b0fc71e9", email: "dakota.johnson@gmail.com"),
        User(id: NSUUID().uuidString, username: "jenny.blackpink", fullName: "Jenny Blackpink", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/twitter-swiftui-app.appspot.com/o/profile_image%2FB84A92B2-34B0-4F7A-86F1-EF217C03CFBE?alt=media&token=f562af1a-8051-47c5-a505-b245b0fc71e9", email: "jenny.blackpink@gmail.com")
    ]
}
