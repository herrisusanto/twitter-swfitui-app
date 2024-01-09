//
//  RegistrationView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var about = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                AuthHeaderView(firstTitle: "Get Started.", secondTitle: "Create your account")
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    
                    CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                    
                    CustomInputField(imageName: "person.badge.key", placeholderText: "Full Name", text: $fullName)
                    
                    CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                    CustomInputField(imageName: "person.bubble", placeholderText: "Tell me more about you!", text: $about)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                Button{
                    viewModel.register(withEmail: email, password: password, fullName: fullName, username: username, about: about)
                }label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                    
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y:0)
                .padding(.top, 32)
                
                Spacer()
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    HStack{
                        Text("Already have an account?")
                            .font(.footnote)
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                    }
                }
                .padding(.bottom, 32)
                .foregroundColor(.blue)
                
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}
