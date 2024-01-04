//
//  UserStatsView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("222")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack{
                Text("12M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        
    }
}

#Preview {
    UserStatsView()
}
