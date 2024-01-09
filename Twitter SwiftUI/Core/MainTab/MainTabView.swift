//
//  MainTab.swift
//  Twitter SwiftUI
//
//  Created by loratech on 02/01/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                } 
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            NotificationsView()
                .badge(4)
                .tabItem {
                    Image(systemName: "bell")
                }
            MessagesView()
                .badge(5)
                .tabItem {
                    Image(systemName: "envelope")
                }
        } 
    }
}

#Preview {
    MainTabView()
}
