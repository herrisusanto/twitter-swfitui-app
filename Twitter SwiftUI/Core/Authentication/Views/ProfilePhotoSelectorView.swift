//
//  SwiftUIView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 06/01/24.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage(){
        guard let selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
    var body: some View {
        VStack(alignment: .center) {
            AuthHeaderView(firstTitle: "Create your account", secondTitle: "Add a profile photo")
            Button{
                showImagePicker.toggle()
            }label:{
                if let profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .modifier(ProfileImageModifier())
                }else {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .modifier(ProfileImageModifier())
                }
                
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage {
                Button{
                    viewModel.uploadProfileImage(selectedImage)
                }label:{
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding(10)
                    
                }
            }
            
            Spacer()
        }
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .frame(width: 180, height: 180)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
