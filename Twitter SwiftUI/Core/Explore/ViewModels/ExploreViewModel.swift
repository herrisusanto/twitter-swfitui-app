//
//  ExploreViewModel.swift
//  Twitter SwiftUI
//
//  Created by loratech on 07/01/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    let service = UserService()
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        }else {
            let lowercaseQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercaseQuery) ||
                $0.fullName.contains(lowercaseQuery)
            })
        }
    }
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
        }
    }
}
