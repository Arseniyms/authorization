//
//  SecureFieldView.swift
//  Authorization
//
//  Created by Arseniy Matus on 07.04.2022.
//

import SwiftUI

struct SecureFieldView: View {
    @Binding var text: String
    @State private var isShowingPass = false
    
    var body: some View {
        HStack {
            if isShowingPass {
                TextField("",text: $text)
                    .keyboardType(.default)
            } else {
                SecureField("", text: $text)
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
        SecureFieldView(text: $text)
    }
}
