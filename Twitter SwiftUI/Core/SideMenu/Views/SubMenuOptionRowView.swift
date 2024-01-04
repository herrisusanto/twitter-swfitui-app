//
//  SubMenuOptionRowView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI

struct SubMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 1) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SubMenuOptionRowView(viewModel: .profile)
}
