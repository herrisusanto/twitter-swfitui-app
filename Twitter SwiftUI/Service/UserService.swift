//
//  UserService.swift
//  Twitter SwiftUI
//
//  Created by loratech on 06/01/24.
//

import Firebase
import FirebaseFirestoreSwift


struct UserService {
    func fetchUser(withUid uid:String, completion: @escaping(User)->Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot else {return}
                
                guard let user = try?snapshot.data(as: User.self) else {return}
                
                completion(user)
                
            }
    }
}
