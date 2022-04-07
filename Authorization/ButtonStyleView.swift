//
//  ButtonStyleView.swift
//  Authorization
//
//  Created by Arseniy Matus on 07.04.2022.
//

import SwiftUI

struct neumorphic: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal,30)
            .padding(20)
            .background(Color.backgroundColor)
            .cornerRadius(20)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.textColor)
            Spacer()
        }
        .padding()
        .background(Color.buttonColor.cornerRadius(8))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
