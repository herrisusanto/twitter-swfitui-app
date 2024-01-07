//
//  ExploreViewModel.swift
//  Twitter SwiftUI
//
//  Created by loratech on 07/01/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            print("There're the users:\(users)")
        }
    }
}
