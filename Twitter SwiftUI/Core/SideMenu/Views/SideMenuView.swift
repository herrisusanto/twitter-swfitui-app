//
//  SideMenuView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 32) {
                Circle()
                    .frame(width: 48, height: 48)
                VStack(alignment: .leading,spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.subheadline)
                    Text("@batman")
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
                        ProfileView()
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

#Preview {
    SideMenuView()
}
