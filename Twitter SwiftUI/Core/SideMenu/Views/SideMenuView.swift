//
//  SideMenuView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 32) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 72, height: 72)
                        
                        
                    VStack(alignment: .leading,spacing: 4) {
                        Text(user.fullName)
                            .font(.subheadline)
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatsView()
                        .padding(.top)
                    Divider().foregroundColor(.gray).frame(width: 280)
                }
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id: \.rawValue){ menu in
                    if menu == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SubMenuOptionRowView(viewModel:menu)
                        }
                        
                    } else if menu == .logout {
                        Button{
                            viewModel.signOut()
                        }label:{
                            SubMenuOptionRowView(viewModel: menu)
                        }
                    } else {
                        SubMenuOptionRowView(viewModel:menu)
                    }
                }
                .frame(height: 40)
                Spacer()
            }
        }
    }
}
    
//    #Preview {
//        SideMenuView()
//    }
