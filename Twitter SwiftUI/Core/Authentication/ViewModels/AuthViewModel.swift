//
//  AuthViewModel.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import Foundation
import Firebase


final class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: user session\(String(describing: userSession))")
    }
    
    func login(withEmail email: String, password: String){
        print("DEBUG: login with email \(email) and password: \(password)")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in...!")
        }
    }
    
    func register(withEmail email: String, password: String , fullName: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
//            self.userSession = user
            
            let data = ["uid": user.uid,
                        "email": email.lowercased(),
                        "username": username.lowercased(),
                        "fullName": fullName,
                        "password": password]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data...!")
                    self.didAuthenticateUser = true 
                }
        }
    }
    
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
}

