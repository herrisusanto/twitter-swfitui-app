//
//  FeedView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 01/01/24.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack{
                        ForEach(viewModel.tweets){ tweet in
                            TweetRowView(tweet: tweet)
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
                    TweetView()
                }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FeedView()
}
