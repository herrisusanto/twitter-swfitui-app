//
//  UserRowView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("@john.doe")
                    .font(.subheadline).bold()
                Text("John Doe")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    UserRowView()
}
