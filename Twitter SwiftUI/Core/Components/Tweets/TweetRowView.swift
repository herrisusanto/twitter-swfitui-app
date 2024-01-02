//
//  TweetRowView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 01/01/24.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top,spacing: 12) {
                Circle()
                    .foregroundColor(.blue)
                .frame(width: 56, height: 56)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("@batman")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("4w")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Text("Good morning Twitter!")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            ActionButtons()
            
            Divider()
            
        }
        .padding(10)
    }
}

#Preview {
    TweetRowView()
}

struct ActionButtons: View {
    var body: some View {
        HStack{
            Button{
                print("button comment!")
            }label: {
                Image(systemName: "bubble.left")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button{
                print("button repost!")
            }label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button{
                print("button like!")
            }label: {
                Image(systemName: "heart")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button{
                print("button bookmark!")
            }label: {
                Image(systemName: "bookmark")
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 10)
    }
}
