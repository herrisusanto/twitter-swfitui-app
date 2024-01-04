//
//  LoginView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(firstTitle: "Hello,", secondTitle: "Welcome Back")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                NavigationLink{
                    Text("Reset password view!")
                }label:{
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button{
                viewModel.login(withEmail: email, password: password)
            }label: {
                Text("Sign In")
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
            
            NavigationLink{
                RegistrationView()
            }label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(.blue)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}
