//
//  ConstructorColor.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 24.01.24.
//

import SwiftUI

struct ConstructorColor {
    static let red_bull = Color(UIColor(hex: "#4570C0"))
    static let mercedes = Color(UIColor(hex: "#86D1BF"))
    static let aston_martin = Color(UIColor(hex: "#4E8A76"))
    static let ferrari = Color(UIColor(hex: "#E5373F"))
    static let mclaren = Color(UIColor(hex: "#E6863B"))
    static let alpine = Color(UIColor(hex: "#4891CC"))
    static let williams = Color(UIColor(hex: "#62BBD9"))
    static let alphatauri = Color(UIColor(hex: "#698EA7"))
    static let alfa = Color(UIColor(hex: "#69E444"))
    static let haas = Color(UIColor(hex: "#B7BABD"))

    static func getColor(for constructorID: String) -> Color {
        switch constructorID {
        case "red_bull": return ConstructorColor.red_bull
        case "mercedes": return ConstructorColor.mercedes
        case "aston_martin": return ConstructorColor.aston_martin
        case "ferrari": return ConstructorColor.ferrari
        case "mclaren": return ConstructorColor.mclaren
        case "alpine": return ConstructorColor.alpine
        case "williams": return ConstructorColor.williams
        case "alphatauri": return ConstructorColor.alphatauri
        case "alfa": return ConstructorColor.alfa
        default: return ConstructorColor.haas
        }
    }
}
