//
//  SideMenuView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI

struct SideMenuView: View {
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
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SubMenuOptionRowView(viewModel:viewModel)
                    }

                } else {
                    SubMenuOptionRowView(viewModel:viewModel)
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
