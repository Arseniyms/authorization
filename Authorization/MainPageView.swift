//
//  MainPageView.swift
//  Authorization
//
//  Created by Arseniy Matus on 07.04.2022.
//

import SwiftUI
    
struct MainPageView: View {
    @Environment(\.dismiss) var dismiss
    
    var token: String
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                if checkToken(token) {
                    Text("Hello")
                }
                else {
                    Text("No hello")
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Log out")
                }
                .buttonStyle(RoundedRectangleButtonStyle())
            }
        }
        .navigationTitle("Log out")
        .navigationBarHidden(true)
    }
}



struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(token: "")
    }
}
