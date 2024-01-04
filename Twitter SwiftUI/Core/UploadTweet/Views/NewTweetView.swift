//
//  NewTweetView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import SwiftUI

struct NewTweetView: View {
    
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
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
                    print("tweet")
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
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }
        Spacer()
    }
}

#Preview {
    NewTweetView()
}
