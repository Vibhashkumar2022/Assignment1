//
//  LoginModifiers.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 24/06/24.
//

import Foundation
import SwiftUI

struct TitleLable: View {
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(foregroundColor)
                .background(backgroundColor)
        }
    }
}

struct MessageLabel: View {
    var message: String
    var body: some View {
        VStack(alignment: .center) {
            Text(message)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .background(.clear)
                .multilineTextAlignment(.leading)
        }
        
    }
}

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text).padding(8)
                } else {
                    TextField(title, text: $text).padding(8)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray).padding(4)
            }
        }
        .frame(height: 35)
        .background(.white)
    }
}
