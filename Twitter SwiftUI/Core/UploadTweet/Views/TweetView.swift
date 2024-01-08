//
//  NewTweetView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import SwiftUI
import Kingfisher

struct TweetView: View {
    
    @State private var caption = "Hi, good morning!"
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var tweetViewModel = TweetViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label:{
                    Text("Cancel")
                        .foregroundStyle(Color(.systemBlue))
                }
                
                Spacer()
                
                Button{
                    tweetViewModel.uploadTweet(withCaption: caption)
                }label:{
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundStyle(.white)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top){
                if let user = viewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 64, height: 64)
                }
                
                
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }
        .onReceive(tweetViewModel.$didUploadTweet){success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
        
        Spacer()
    }
}

#Preview {
    TweetView()
        .environmentObject(AuthViewModel())
}
