//
//  FeedView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 01/01/24.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack{
                        ForEach(0...20, id: \.self){ _ in
                            TweetRowView()
                                .padding()
                            
                        }
                    }
                }
                Button{
                    showNewTweetView.toggle()
                }label:{
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .padding()
                }
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding()
                .fullScreenCover(isPresented: $showNewTweetView){
                    NewTweetView()
                }
        }
    }
}

#Preview {
    FeedView()
}
