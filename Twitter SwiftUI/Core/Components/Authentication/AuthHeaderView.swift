//
//  CustomHeaderView.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let firstTitle: String
    let secondTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
            }
            Text(firstTitle)
                .font(.largeTitle).fontWeight(.semibold)
            
            Text(secondTitle)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    AuthHeaderView(firstTitle: "First Title", secondTitle: "Second Title")
}
