//
//  Monza.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 12.02.24.
//

import SwiftUI

struct Monza: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 472.0
        let height = 232.0
        path.move(to: CGPoint(x: 0.84737*width, y: 0.96321*height))
        path.addLine(to: CGPoint(x: 0.5638*width, y: 0.97575*height))
        path.addLine(to: CGPoint(x: 0.40117*width, y: 0.97993*height))
        path.addCurve(to: CGPoint(x: 0.3824*width, y: 0.95903*height), control1: CGPoint(x: 0.39672*width, y: 0.98049*height), control2: CGPoint(x: 0.38674*width, y: 0.97709*height))
        path.addCurve(to: CGPoint(x: 0.34028*width, y: 0.97575*height), control1: CGPoint(x: 0.37698*width, y: 0.93645*height), control2: CGPoint(x: 0.3628*width, y: 0.95652*height))
        path.addCurve(to: CGPoint(x: 0.2131*width, y: 0.97993*height), control1: CGPoint(x: 0.31777*width, y: 0.99498*height), control2: CGPoint(x: 0.24145*width, y: 0.9908*height))
        path.addCurve(to: CGPoint(x: 0.10134*width, y: 0.63712*height), control1: CGPoint(x: 0.18474*width, y: 0.96906*height), control2: CGPoint(x: 0.12052*width, y: 0.92308*height))
        path.addCurve(to: CGPoint(x: 0.07882*width, y: 0.38963*height), control1: CGPoint(x: 0.08599*width, y: 0.40836*height), control2: CGPoint(x: 0.07993*width, y: 0.37681*height))
        path.addCurve(to: CGPoint(x: 0.05546*width, y: 0.35953*height), control1: CGPoint(x: 0.07312*width, y: 0.39158*height), control2: CGPoint(x: 0.06047*width, y: 0.38829*height))
        path.addCurve(to: CGPoint(x: 0.00626*width, y: 0.14465*height), control1: CGPoint(x: 0.05046*width, y: 0.33077*height), control2: CGPoint(x: 0.02057*width, y: 0.20429*height))
        path.addCurve(to: CGPoint(x: 0.0417*width, y: 0.04599*height), control1: CGPoint(x: 0.00292*width, y: 0.11734*height), control2: CGPoint(x: 0.00534*width, y: 0.05936*height))
        path.addCurve(to: CGPoint(x: 0.12927*width, y: 0.01003*height), control1: CGPoint(x: 0.07807*width, y: 0.03261*height), control2: CGPoint(x: 0.11524*width, y: 0.01644*height))
        path.addCurve(to: CGPoint(x: 0.15304*width, y: 0.02759*height), control1: CGPoint(x: 0.13483*width, y: 0.00976*height), control2: CGPoint(x: 0.14737*width, y: 0.01288*height))
        path.addCurve(to: CGPoint(x: 0.45038*width, y: 0.67726*height), control1: CGPoint(x: 0.16013*width, y: 0.04599*height), control2: CGPoint(x: 0.23978*width, y: 0.35702*height))
        path.addCurve(to: CGPoint(x: 0.49291*width, y: 0.68311*height), control1: CGPoint(x: 0.45997*width, y: 0.69064*height), control2: CGPoint(x: 0.48082*width, y: 0.68896*height))
        path.addCurve(to: CGPoint(x: 0.53086*width, y: 0.7199*height), control1: CGPoint(x: 0.505*width, y: 0.67726*height), control2: CGPoint(x: 0.51835*width, y: 0.69314*height))
        path.addCurve(to: CGPoint(x: 0.61927*width, y: 0.73411*height), control1: CGPoint(x: 0.54337*width, y: 0.74666*height), control2: CGPoint(x: 0.56547*width, y: 0.73579*height))
        path.addCurve(to: CGPoint(x: 0.94579*width, y: 0.73411*height), control1: CGPoint(x: 0.6623*width, y: 0.73278*height), control2: CGPoint(x: 0.85488*width, y: 0.73356*height))
        path.addCurve(to: CGPoint(x: 0.99124*width, y: 0.76421*height), control1: CGPoint(x: 0.95997*width, y: 0.73356*height), control2: CGPoint(x: 0.98891*width, y: 0.7388*height))
        path.addCurve(to: CGPoint(x: 0.99124*width, y: 0.86455*height), control1: CGPoint(x: 0.99416*width, y: 0.79599*height), control2: CGPoint(x: 0.99708*width, y: 0.84783*height))
        path.addCurve(to: CGPoint(x: 0.92744*width, y: 0.94983*height), control1: CGPoint(x: 0.9854*width, y: 0.88127*height), control2: CGPoint(x: 0.9608*width, y: 0.93645*height))
        path.addCurve(to: CGPoint(x: 0.86364*width, y: 0.96237*height), control1: CGPoint(x: 0.90075*width, y: 0.96054*height), control2: CGPoint(x: 0.87379*width, y: 0.96265*height))
        path.addLine(to: CGPoint(x: 0.84821*width, y: 0.96321*height))
        return path
    }
}

#Preview {
    Monza()
}
