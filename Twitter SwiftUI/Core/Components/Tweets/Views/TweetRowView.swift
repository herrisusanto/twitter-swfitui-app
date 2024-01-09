//
//  TweetRowView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 01/01/24.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet){
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top,spacing: 12) {
                if let user = viewModel.tweet.user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    if let user = viewModel.tweet.user {
                        HStack {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("@\(user.username)")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("4w")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    Text(viewModel.tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            actionButtons
            
            Divider()
            
        }
        .padding(10)
    }
}

#Preview {
    TweetRowView(tweet: MockTweet.tweet)
}

extension TweetRowView {
    var actionButtons: some View {
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
                viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
            }label: {
                HStack {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill": "heart")
                        .font(.subheadline)
                    .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                    
                    if viewModel.tweet.likes != 0 {
                        Text("\(viewModel.tweet.likes)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
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
