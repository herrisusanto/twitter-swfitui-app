//
//  ContentView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 03/01/24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
        
    }
}


#Preview {
    NavigationView {
        ContentView()
    }
}

extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .leading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? .white : .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                }label:{
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing){
                Button {
                    print("Refresh button!")
                }label: {
                    Image(systemName: "arrow.clockwise")
                        .frame(width: 32, height: 32)
                }
            }
        }
    }
}
