//
//  ExploreView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 02/01/24.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var viewModel = ExploreViewModel() 
    
    var body: some View {
            VStack{
                SearchBar(text: $viewModel.searchText)
                    .padding()
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.searchableUsers){ user in
                            NavigationLink {
                                ProfileView(user: user)
                            }label: {
                                UserRowView(user: user)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ExploreView()
}
