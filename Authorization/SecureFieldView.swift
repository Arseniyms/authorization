//
//  SecureFieldView.swift
//  Authorization
//
//  Created by Arseniy Matus on 07.04.2022.
//

import SwiftUI

struct SecureFieldView: View {
    var title = ""
    @Binding var text: String
    var textColor: Color = .textColor
    @State private var isShowingPass = false
    
    var body: some View {
        HStack {
            if isShowingPass {
                TextField(title,text: $text)
                    .foregroundColor(textColor)
                    .keyboardType(.default)
            } else {
                SecureField(title, text: $text)
                    .keyboardType(.default)
            }
            Button {
                isShowingPass.toggle()
            } label: {
                Image(systemName: isShowingPass ?  "eye" : "eye.fill")
            }
            .padding(.vertical, 5)
        }
    }
}

struct SecureFieldView_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        SecureFieldView(text: $text, textColor: .red)
    }
}
