//
//  ColorExtension.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import SwiftUI

struct AppColors {
    static let background = isLightMode ? Color(UIColor(hex: "#F7F7F7")) : Color(UIColor(hex: "#000000"))
    static let layer = isLightMode ? Color(UIColor(hex: "#ffffff")) : Color(UIColor(hex: "#161616"))
    static let textPrimary = isLightMode ? Color(UIColor(hex: "#1A1C20")) : Color(UIColor(hex: "#F3F3F3"))
    static let textSecondary = isLightMode ? Color(UIColor(hex: "#767E85")) : Color(UIColor(hex: "#8F8F8F"))
    static let accentColor = isLightMode ? Color(UIColor(hex: "#DD3E86")) : Color(UIColor(hex: "#DD3E86"))
    static let accentShade = isLightMode ? Color(UIColor(hex: "#DD3E86")) : Color(UIColor(hex: "#DD3E86"))
    static let gray = isLightMode ? Color(UIColor(hex: "#E9E9E9")) : Color(UIColor(hex: "#36353A"))
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

let currentSystemTheme: () -> Bool = {
    return UITraitCollection.current.userInterfaceStyle == .light
}

let isLightMode = currentSystemTheme()
