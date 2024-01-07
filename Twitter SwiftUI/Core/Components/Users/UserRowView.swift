//
//  UserRowView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("@\(user.username)")
                    .font(.subheadline).bold()
                Text(user.fullName)
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
    UserRowView(user: User(id: NSUUID().uuidString, username: "dakota.johnson", fullName: "Dakota Johnson", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/twitter-swiftui-app.appspot.com/o/profile_image%2FB84A92B2-34B0-4F7A-86F1-EF217C03CFBE?alt=media&token=f562af1a-8051-47c5-a505-b245b0fc71e9", email: "dakota.johnson@gmail.com"))
}
