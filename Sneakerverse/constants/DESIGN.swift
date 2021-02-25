//
//  Design.swift
//  Sneakerverse
//
//  Created by Dung  on 08.12.20.
//

import Foundation
import SwiftUI

struct DESIGN{
    struct COLOR {
        static let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
        static let pink = Color(red: 211.0/255.0, green: 88.0/255.0, blue: 245.0/255.0)
        static let midPurple = Color(red: 132/255.0, green: 0/255.0, blue: 255/255.0)
        static let darkPurple = Color(red: 80/255.0, green: 48/255.0, blue: 187/255.0)
        static let backgroundGradient = LinearGradient(gradient: Gradient(colors: [pink, midPurple, darkPurple]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
