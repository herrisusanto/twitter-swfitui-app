//
//  ExploreView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 02/01/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0...15, id:\.self){_ in
                            NavigationLink {
                                ProfileView()
                            }label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExploreView()
}
