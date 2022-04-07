//
//  Colors.swift
//  Authorization
//
//  Created by Arseniy Matus on 06.04.2022.
//

import Foundation
import SwiftUI

//let divider = 255.0

//func gradientBackgound() -> some View {
//    LinearGradient(gradient: Gradient(colors:
//                                        [Color(red: 12 / divider, green: 5 / divider, blue: 109 / divider),
//                                         Color(red: 89 / divider, green: 13 / divider, blue: 130 / divider),
//                                         Color(red: 182 / divider, green: 26 / divider, blue: 174 / divider),
//                                         Color(red: 242 / divider, green: 93 / divider, blue: 156 / divider)]),
//                   startPoint: UnitPoint(x: 0, y: 0.5), endPoint: UnitPoint(x: 1, y: 0))
//}
//
//func radialGradient() -> some View {
//    VStack(spacing: 0) {
//        RadialGradient(gradient: Gradient(colors:
//                                            [
//                                                Color(red: 27 / divider, green: 38 / divider, blue: 44 / divider),
//                                                //                                                Color(red: 58 / divider, green: 71 / divider, blue: 80 / divider)
//                                            ]),
//                       center: .leading, startRadius: 100, endRadius: 1000)
//    }
//}

extension ShapeStyle where Self == Color {
    static var textColor: Color {
        Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255)
    }
    
    static var backgroundColor: Color {
        Color(red: 7 / 255, green: 26 / 255, blue: 82 / 255)
    }
    
    static var lightShadow :Color {
        Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    }
    static var darkShadow : Color {
        Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    }
    
}
