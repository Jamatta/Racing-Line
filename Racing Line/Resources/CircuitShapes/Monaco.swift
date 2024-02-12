//
//  Monaco.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 12.02.24.
//

import SwiftUI

struct Monaco: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 472.0
        let height = 232.0
        path.move(to: CGPoint(x: 0.06778*width, y: 0.46013*height))
        path.addCurve(to: CGPoint(x: 0.15356*width, y: 0.26203*height), control1: CGPoint(x: 0.07685*width, y: 0.4173*height), control2: CGPoint(x: 0.10669*width, y: 0.31772*height))
        path.addCurve(to: CGPoint(x: 0.18494*width, y: 0.23291*height), control1: CGPoint(x: 0.15941*width, y: 0.2462*height), control2: CGPoint(x: 0.16695*width, y: 0.21013*height))
        path.addCurve(to: CGPoint(x: 0.35314*width, y: 0.30127*height), control1: CGPoint(x: 0.20293*width, y: 0.2557*height), control2: CGPoint(x: 0.33724*width, y: 0.29937*height))
        path.addCurve(to: CGPoint(x: 0.52552*width, y: 0.35443*height), control1: CGPoint(x: 0.36904*width, y: 0.30316*height), control2: CGPoint(x: 0.42762*width, y: 0.36013*height))
        path.addCurve(to: CGPoint(x: 0.68368*width, y: 0.37595*height), control1: CGPoint(x: 0.55105*width, y: 0.35443*height), control2: CGPoint(x: 0.60209*width, y: 0.39747*height))
        path.addCurve(to: CGPoint(x: 0.69833*width, y: 0.21835*height), control1: CGPoint(x: 0.7205*width, y: 0.36076*height), control2: CGPoint(x: 0.70628*width, y: 0.25*height))
        path.addCurve(to: CGPoint(x: 0.80879*width, y: 0.06329*height), control1: CGPoint(x: 0.69038*width, y: 0.18671*height), control2: CGPoint(x: 0.69163*width, y: 0.13987*height))
        path.addCurve(to: CGPoint(x: 0.90418*width, y: 0.01266*height), control1: CGPoint(x: 0.8749*width, y: 0.01266*height), control2: CGPoint(x: 0.89874*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.89079*width, y: 0.11329*height), control1: CGPoint(x: 0.90962*width, y: 0.02532*height), control2: CGPoint(x: 0.88954*width, y: 0.08987*height))
        path.addCurve(to: CGPoint(x: 0.89079*width, y: 0.19177*height), control1: CGPoint(x: 0.8918*width, y: 0.13203*height), control2: CGPoint(x: 0.89121*width, y: 0.17342*height))
        path.addCurve(to: CGPoint(x: 0.9159*width, y: 0.18101*height), control1: CGPoint(x: 0.89554*width, y: 0.20443*height), control2: CGPoint(x: 0.9072*width, y: 0.22*height))
        path.addCurve(to: CGPoint(x: 0.9272*width, y: 0.07215*height), control1: CGPoint(x: 0.9159*width, y: 0.13924*height), control2: CGPoint(x: 0.88494*width, y: 0.05949*height))
        path.addCurve(to: CGPoint(x: 0.99456*width, y: 0.11329*height), control1: CGPoint(x: 0.96946*width, y: 0.08481*height), control2: CGPoint(x: 0.99833*width, y: 0.09557*height))
        path.addCurve(to: CGPoint(x: 0.89079*width, y: 0.33038*height), control1: CGPoint(x: 0.99155*width, y: 0.12747*height), control2: CGPoint(x: 0.92413*width, y: 0.26392*height))
        path.addCurve(to: CGPoint(x: 0.7046*width, y: 0.47468*height), control1: CGPoint(x: 0.86597*width, y: 0.37848*height), control2: CGPoint(x: 0.79397*width, y: 0.47468*height))
        path.addCurve(to: CGPoint(x: 0.50753*width, y: 0.43924*height), control1: CGPoint(x: 0.59289*width, y: 0.47468*height), control2: CGPoint(x: 0.52636*width, y: 0.4519*height))
        path.addCurve(to: CGPoint(x: 0.45314*width, y: 0.42595*height), control1: CGPoint(x: 0.4887*width, y: 0.42658*height), control2: CGPoint(x: 0.46402*width, y: 0.40253*height))
        path.addCurve(to: CGPoint(x: 0.39498*width, y: 0.38671*height), control1: CGPoint(x: 0.44226*width, y: 0.44937*height), control2: CGPoint(x: 0.41381*width, y: 0.40506*height))
        path.addCurve(to: CGPoint(x: 0.22301*width, y: 0.30127*height), control1: CGPoint(x: 0.37615*width, y: 0.36835*height), control2: CGPoint(x: 0.2272*width, y: 0.30127*height))
        path.addCurve(to: CGPoint(x: 0.17322*width, y: 0.32468*height), control1: CGPoint(x: 0.21883*width, y: 0.30127*height), control2: CGPoint(x: 0.18912*width, y: 0.28418*height))
        path.addCurve(to: CGPoint(x: 0.12594*width, y: 0.46709*height), control1: CGPoint(x: 0.15732*width, y: 0.36519*height), control2: CGPoint(x: 0.11339*width, y: 0.44494*height))
        path.addCurve(to: CGPoint(x: 0.13431*width, y: 0.55*height), control1: CGPoint(x: 0.13849*width, y: 0.48924*height), control2: CGPoint(x: 0.14812*width, y: 0.49304*height))
        path.addCurve(to: CGPoint(x: 0.09079*width, y: 0.71456*height), control1: CGPoint(x: 0.1205*width, y: 0.60696*height), control2: CGPoint(x: 0.10377*width, y: 0.71076*height))
        path.addCurve(to: CGPoint(x: 0.05356*width, y: 0.77152*height), control1: CGPoint(x: 0.07782*width, y: 0.71835*height), control2: CGPoint(x: 0.05105*width, y: 0.70759*height))
        path.addCurve(to: CGPoint(x: 0.09414*width, y: 0.96582*height), control1: CGPoint(x: 0.05607*width, y: 0.83544*height), control2: CGPoint(x: 0.06276*width, y: 0.92215*height))
        path.addCurve(to: CGPoint(x: 0.04017*width, y: 0.98354*height), control1: CGPoint(x: 0.10293*width, y: 0.98544*height), control2: CGPoint(x: 0.08159*width, y: 1.00127*height))
        path.addCurve(to: CGPoint(x: 0.01004*width, y: 0.91392*height), control1: CGPoint(x: -0.00126*width, y: 0.96582*height), control2: CGPoint(x: 0.00711*width, y: 0.94494*height))
        path.addCurve(to: CGPoint(x: 0.01004*width, y: 0.73481*height), control1: CGPoint(x: 0.0159*width, y: 0.89367*height), control2: CGPoint(x: -0.00335*width, y: 0.84051*height))
        path.addCurve(to: CGPoint(x: 0.06695*width, y: 0.46266*height), control1: CGPoint(x: 0.02075*width, y: 0.65025*height), control2: CGPoint(x: 0.05244*width, y: 0.51814*height))
        return path
    }
}

#Preview {
    Monaco()
}
