//
//  MainTab.swift
//  Twitter SwiftUI
//
//  Created by loratech on 02/01/24.
//

import SwiftUI

struct MainTabView: View {
    @State var activeTab:MainTabViewModel = .explore
    var body: some View {
        TabView(selection: $activeTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .onTapGesture {
                    activeTab = .home
                }
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onTapGesture {
                    activeTab = .explore
                }
            NotificationsView()
                .badge(4)
                .tabItem {
                    Image(systemName: "bell")
                }
                .onTapGesture {
                    activeTab = .notifications
                }
            MessagesView()
                .badge(5)
                .tabItem {
                    Image(systemName: "envelope")
                }
                .onTapGesture {
                    activeTab = .messages
                }
                
        }
        .navigationTitle(activeTab.title)
        
        
        
    }
}

#Preview {
    MainTabView()
}
