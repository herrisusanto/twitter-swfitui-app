//
//  TextArea.swift
//  Twitter SwiftUI
//
//  Created by loratech on 04/01/24.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(uiColor: .placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }else {
                TextEditor(text: $text)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            
        }
        .font(.body)
    }
}

#Preview {
    TextArea("What's happening", text: .constant("Input text area here."))
}
