//
//  Color.swift
//  RecipeGrimoire
//
//  Created by Toan Pham on 9/19/21.
//

import Foundation
import SwiftUI

struct ColorTheme{
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
}

extension Color{
    static let theme = ColorTheme()
}
