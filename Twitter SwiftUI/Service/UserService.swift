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
    
    func fetchUsers(completion: @escaping([User])->Void){
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
//                documents.forEach { document in
//                    guard let user = try?document.data(as: User.self) else {return}
//                    users.append(user)
//                }
                let users = documents.compactMap({try? $0.data(as: User.self)})
                
                completion(users)
                print("DEBUG: Users are here:\(users)")
            }
    }
}
