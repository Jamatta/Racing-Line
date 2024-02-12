//
//  Silverstone.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 11.02.24.
//

import SwiftUI

struct Silverstone: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 472.0
        let height = 232.0
        path.move(to: CGPoint(x: 0.58961*width, y: 0.84257*height))
        path.addLine(to: CGPoint(x: 0.4632*width, y: 0.65566*height))
        path.addCurve(to: CGPoint(x: 0.4671*width, y: 0.602*height), control1: CGPoint(x: 0.45974*width, y: 0.64701*height), control2: CGPoint(x: 0.45567*width, y: 0.62417*height))
        path.addCurve(to: CGPoint(x: 0.51212*width, y: 0.49469*height), control1: CGPoint(x: 0.47853*width, y: 0.57983*height), control2: CGPoint(x: 0.50187*width, y: 0.52123*height))
        path.addCurve(to: CGPoint(x: 0.49524*width, y: 0.3862*height), control1: CGPoint(x: 0.51587*width, y: 0.47465*height), control2: CGPoint(x: 0.51775*width, y: 0.42488*height))
        path.addCurve(to: CGPoint(x: 0.44242*width, y: 0.29658*height), control1: CGPoint(x: 0.47272*width, y: 0.34752*height), control2: CGPoint(x: 0.45065*width, y: 0.31034*height))
        path.addCurve(to: CGPoint(x: 0.4671*width, y: 0.26769*height), control1: CGPoint(x: 0.43954*width, y: 0.28557*height), control2: CGPoint(x: 0.44043*width, y: 0.26439*height))
        path.addCurve(to: CGPoint(x: 0.52987*width, y: 0.25236*height), control1: CGPoint(x: 0.49376*width, y: 0.27099*height), control2: CGPoint(x: 0.52006*width, y: 0.25884*height))
        path.addCurve(to: CGPoint(x: 0.51905*width, y: 0.21698*height), control1: CGPoint(x: 0.5342*width, y: 0.24961*height), control2: CGPoint(x: 0.53809*width, y: 0.23868*height))
        path.addCurve(to: CGPoint(x: 0.45108*width, y: 0.1533*height), control1: CGPoint(x: 0.5*width, y: 0.19528*height), control2: CGPoint(x: 0.4658*width, y: 0.16549*height))
        path.addCurve(to: CGPoint(x: 0.41082*width, y: 0.1645*height), control1: CGPoint(x: 0.443*width, y: 0.15311*height), control2: CGPoint(x: 0.42363*width, y: 0.15507*height))
        path.addCurve(to: CGPoint(x: 0.10736*width, y: 0.48408*height), control1: CGPoint(x: 0.3948*width, y: 0.1763*height), control2: CGPoint(x: 0.12121*width, y: 0.46344*height))
        path.addCurve(to: CGPoint(x: 0.1*width, y: 0.53125*height), control1: CGPoint(x: 0.09351*width, y: 0.50472*height), control2: CGPoint(x: 0.08788*width, y: 0.5112*height))
        path.addCurve(to: CGPoint(x: 0.1671*width, y: 0.59139*height), control1: CGPoint(x: 0.12366*width, y: 0.54029*height), control2: CGPoint(x: 0.17022*width, y: 0.56498*height))
        path.addCurve(to: CGPoint(x: 0.13463*width, y: 0.63561*height), control1: CGPoint(x: 0.1632*width, y: 0.62441*height), control2: CGPoint(x: 0.15584*width, y: 0.6421*height))
        path.addCurve(to: CGPoint(x: 0.00736*width, y: 0.46403*height), control1: CGPoint(x: 0.11342*width, y: 0.62913*height), control2: CGPoint(x: 0.01688*width, y: 0.54599*height))
        path.addCurve(to: CGPoint(x: 0.03766*width, y: 0.08785*height), control1: CGPoint(x: -0.00026*width, y: 0.39847*height), control2: CGPoint(x: 0.02439*width, y: 0.18593*height))
        path.addCurve(to: CGPoint(x: 0.12251*width, y: 0.00825*height), control1: CGPoint(x: 0.04343*width, y: 0.06073*height), control2: CGPoint(x: 0.06848*width, y: 0.00684*height))
        path.addCurve(to: CGPoint(x: 0.25974*width, y: 0.01887*height), control1: CGPoint(x: 0.19004*width, y: 0.01002*height), control2: CGPoint(x: 0.25671*width, y: 0.01828*height))
        path.addCurve(to: CGPoint(x: 0.36883*width, y: 0.05425*height), control1: CGPoint(x: 0.26277*width, y: 0.01946*height), control2: CGPoint(x: 0.32684*width, y: 0.05837*height))
        path.addCurve(to: CGPoint(x: 0.41082*width, y: 0.03833*height), control1: CGPoint(x: 0.40242*width, y: 0.05094*height), control2: CGPoint(x: 0.41082*width, y: 0.04226*height))
        path.addCurve(to: CGPoint(x: 0.45108*width, y: 0.03833*height), control1: CGPoint(x: 0.4189*width, y: 0.03164*height), control2: CGPoint(x: 0.43827*width, y: 0.02229*height))
        path.addCurve(to: CGPoint(x: 0.52554*width, y: 0.09847*height), control1: CGPoint(x: 0.4671*width, y: 0.05837*height), control2: CGPoint(x: 0.48398*width, y: 0.10083*height))
        path.addCurve(to: CGPoint(x: 0.59697*width, y: 0.08314*height), control1: CGPoint(x: 0.5671*width, y: 0.09611*height), control2: CGPoint(x: 0.57446*width, y: 0.06368*height))
        path.addCurve(to: CGPoint(x: 0.63593*width, y: 0.1645*height), control1: CGPoint(x: 0.61948*width, y: 0.10259*height), control2: CGPoint(x: 0.62987*width, y: 0.12913*height))
        path.addCurve(to: CGPoint(x: 0.76104*width, y: 0.3467*height), control1: CGPoint(x: 0.64199*width, y: 0.19988*height), control2: CGPoint(x: 0.6974*width, y: 0.27535*height))
        path.addCurve(to: CGPoint(x: 0.97489*width, y: 0.62382*height), control1: CGPoint(x: 0.81195*width, y: 0.40377*height), control2: CGPoint(x: 0.92482*width, y: 0.55523*height))
        path.addCurve(to: CGPoint(x: 0.99048*width, y: 0.70224*height), control1: CGPoint(x: 0.98528*width, y: 0.63895*height), control2: CGPoint(x: 1.00294*width, y: 0.67583*height))
        path.addCurve(to: CGPoint(x: 0.94502*width, y: 0.76297*height), control1: CGPoint(x: 0.97489*width, y: 0.73526*height), control2: CGPoint(x: 0.971*width, y: 0.76179*height))
        path.addCurve(to: CGPoint(x: 0.88225*width, y: 0.77476*height), control1: CGPoint(x: 0.91905*width, y: 0.76415*height), control2: CGPoint(x: 0.88918*width, y: 0.76946*height))
        path.addCurve(to: CGPoint(x: 0.75238*width, y: 0.86969*height), control1: CGPoint(x: 0.87671*width, y: 0.77901*height), control2: CGPoint(x: 0.79336*width, y: 0.83982*height))
        path.addCurve(to: CGPoint(x: 0.75238*width, y: 0.9033*height), control1: CGPoint(x: 0.74921*width, y: 0.8748*height), control2: CGPoint(x: 0.74476*width, y: 0.88868*height))
        path.addCurve(to: CGPoint(x: 0.75974*width, y: 0.95047*height), control1: CGPoint(x: 0.7619*width, y: 0.92158*height), control2: CGPoint(x: 0.7671*width, y: 0.93868*height))
        path.addCurve(to: CGPoint(x: 0.72208*width, y: 0.98939*height), control1: CGPoint(x: 0.75385*width, y: 0.95991*height), control2: CGPoint(x: 0.73218*width, y: 0.98035*height))
        path.addCurve(to: CGPoint(x: 0.66667*width, y: 0.9717*height), control1: CGPoint(x: 0.71198*width, y: 0.9943*height), control2: CGPoint(x: 0.68675*width, y: 0.99764*height))
        path.addCurve(to: CGPoint(x: 0.59048*width, y: 0.84375*height), control1: CGPoint(x: 0.64658*width, y: 0.94575*height), control2: CGPoint(x: 0.6075*width, y: 0.87559*height))
        path.closeSubpath()
        return path
    }
}

struct Silverstone_Previews: PreviewProvider {
    static var previews: some View {
        Silverstone()
            .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .aspectRatio(contentMode: .fit)
        
    }
}
