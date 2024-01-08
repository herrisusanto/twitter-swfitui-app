//
//  NewTweetViewModel.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import Foundation


class TweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true 
            } else {
                
            }
        }
    }
}

