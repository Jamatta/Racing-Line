//
//  testShapes.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 11.02.24.
//

import SwiftUI

struct Suzuka: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 354.0
        let height = 174.1
        path.move(to: CGPoint(x: 0.58961*width, y: 0.84257*height))
      
        path.closeSubpath()
        return path
    }
}

struct Spa: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 354.0
        let height = 174.1
        path.move(to: CGPoint(x: 0.58961*width, y: 0.84257*height))
      
        path.closeSubpath()
        return path
    }
}

struct Monza: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 354.0
        let height = 174.1
        path.move(to: CGPoint(x: 0.58961*width, y: 0.84257*height))
      
        path.closeSubpath()
        return path
    }
}

struct Monaco: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 354.0
        let height = 174.1
        path.move(to: CGPoint(x: 0.58961*width, y: 0.84257*height))
      
        path.closeSubpath()
        return path
    }
}

struct MelbourneShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 472.0
        let height = 232.0
        path.move(to: CGPoint(x: 0.62063*width, y: 0.98102*height))
        path.addLine(to: CGPoint(x: 0.38848*width, y: 0.98978*height))
        path.addCurve(to: CGPoint(x: 0.33018*width, y: 0.8781*height), control1: CGPoint(x: 0.3829*width, y: 0.95304*height), control2: CGPoint(x: 0.36341*width, y: 0.87927*height))
        path.addCurve(to: CGPoint(x: 0.05539*width, y: 0.82263*height), control1: CGPoint(x: 0.28863*width, y: 0.87664*height), control2: CGPoint(x: 0.11625*width, y: 0.91095*height))
        path.addCurve(to: CGPoint(x: 0.0707*width, y: 0.73431*height), control1: CGPoint(x: 0.04883*width, y: 0.80292*height), control2: CGPoint(x: 0.05357*width, y: 0.78248*height))
        path.addCurve(to: CGPoint(x: 0.0707*width, y: 0.65985*height), control1: CGPoint(x: 0.08783*width, y: 0.68613*height), control2: CGPoint(x: 0.08601*width, y: 0.68321*height))
        path.addCurve(to: CGPoint(x: 0.00474*width, y: 0.53796*height), control1: CGPoint(x: 0.05539*width, y: 0.6365*height), control2: CGPoint(x: 0.00474*width, y: 0.54964*height))
        path.addCurve(to: CGPoint(x: 0.01312*width, y: 0.3708*height), control1: CGPoint(x: 0.00474*width, y: 0.52861*height), control2: CGPoint(x: 0.01033*width, y: 0.42263*height))
        path.addLine(to: CGPoint(x: 0.04738*width, y: 0.2073*height))
        path.addCurve(to: CGPoint(x: 0.05867*width, y: 0.12044*height), control1: CGPoint(x: 0.0492*width, y: 0.17713*height), control2: CGPoint(x: 0.05401*width, y: 0.11752*height))
        path.addCurve(to: CGPoint(x: 0.12354*width, y: 0.07883*height), control1: CGPoint(x: 0.0645*width, y: 0.12409*height), control2: CGPoint(x: 0.10569*width, y: 0.11387*height))
        path.addCurve(to: CGPoint(x: 0.22012*width, y: 0.01898*height), control1: CGPoint(x: 0.1414*width, y: 0.0438*height), control2: CGPoint(x: 0.18586*width, y: -0.0146*height))
        path.addCurve(to: CGPoint(x: 0.36006*width, y: 0.29124*height), control1: CGPoint(x: 0.25437*width, y: 0.05255*height), control2: CGPoint(x: 0.3207*width, y: 0.1*height))
        path.addCurve(to: CGPoint(x: 0.53681*width, y: 0.56788*height), control1: CGPoint(x: 0.39942*width, y: 0.48248*height), control2: CGPoint(x: 0.45299*width, y: 0.58102*height))
        path.addCurve(to: CGPoint(x: 0.62755*width, y: 0.54453*height), control1: CGPoint(x: 0.60386*width, y: 0.55737*height), control2: CGPoint(x: 0.62524*width, y: 0.54793*height))
        path.addLine(to: CGPoint(x: 0.66327*width, y: 0.45401*height))
        path.addCurve(to: CGPoint(x: 0.67493*width, y: 0.44088*height), control1: CGPoint(x: 0.66351*width, y: 0.45012*height), control2: CGPoint(x: 0.66618*width, y: 0.44204*height))
        path.addCurve(to: CGPoint(x: 0.79227*width, y: 0.42263*height), control1: CGPoint(x: 0.68367*width, y: 0.43971*height), control2: CGPoint(x: 0.7568*width, y: 0.42822*height))
        path.addCurve(to: CGPoint(x: 0.84657*width, y: 0.44088*height), control1: CGPoint(x: 0.80297*width, y: 0.42092*height), control2: CGPoint(x: 0.82879*width, y: 0.42219*height))
        path.addCurve(to: CGPoint(x: 0.99198*width, y: 0.59927*height), control1: CGPoint(x: 0.86436*width, y: 0.45956*height), control2: CGPoint(x: 0.95093*width, y: 0.55426*height))
        path.addCurve(to: CGPoint(x: 0.99198*width, y: 0.64599*height), control1: CGPoint(x: 0.99466*width, y: 0.60365*height), control2: CGPoint(x: 0.9984*width, y: 0.61912*height))
        path.addCurve(to: CGPoint(x: 0.9355*width, y: 0.8365*height), control1: CGPoint(x: 0.98557*width, y: 0.67285*height), control2: CGPoint(x: 0.95165*width, y: 0.78419*height))
        path.addCurve(to: CGPoint(x: 0.89723*width, y: 0.84745*height), control1: CGPoint(x: 0.93331*width, y: 0.8472*height), control2: CGPoint(x: 0.92259*width, y: 0.86438*height))
        path.addCurve(to: CGPoint(x: 0.82216*width, y: 0.80584*height), control1: CGPoint(x: 0.87187*width, y: 0.83051*height), control2: CGPoint(x: 0.83661*width, y: 0.81265*height))
        path.addCurve(to: CGPoint(x: 0.80722*width, y: 0.82628*height), control1: CGPoint(x: 0.81718*width, y: 0.8017*height), control2: CGPoint(x: 0.80722*width, y: 0.8*height))
        path.addCurve(to: CGPoint(x: 0.80722*width, y: 0.92482*height), control1: CGPoint(x: 0.80722*width, y: 0.85255*height), control2: CGPoint(x: 0.80722*width, y: 0.90292*height))
        path.addCurve(to: CGPoint(x: 0.78644*width, y: 0.97153*height), control1: CGPoint(x: 0.80867*width, y: 0.94039*height), control2: CGPoint(x: 0.80656*width, y: 0.97153*height))
        path.addCurve(to: CGPoint(x: 0.62066*width, y: 0.98102*height), control1: CGPoint(x: 0.76633*width, y: 0.97153*height), control2: CGPoint(x: 0.67821*width, y: 0.97786*height))
        path.closeSubpath()
        return path
    }
}
