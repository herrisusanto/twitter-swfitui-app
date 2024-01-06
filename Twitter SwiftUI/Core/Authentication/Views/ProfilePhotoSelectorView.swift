//
//  SwiftUIView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 06/01/24.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack(alignment: .center) {
            AuthHeaderView(firstTitle: "Create your account", secondTitle: "Add a profile photo")
            Button{
                print("Change profile photo")
            }label:{
                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .frame(width: 180, height: 180)
                    .padding()
                    
            }
            Spacer()
        }
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
