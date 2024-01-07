//
//  User.swift
//  Twitter SwiftUI
//
//  Created by loratech on 06/01/24.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullName: String
    let profileImageUrl: String
    let email: String
     
}
