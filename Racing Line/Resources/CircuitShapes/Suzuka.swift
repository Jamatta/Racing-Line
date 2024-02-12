//
//  Suzuka.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 12.02.24.
//

import SwiftUI

struct Suzuka: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 472.0
        let height = 232.0
        path.move(to: CGPoint(x: 0.33389*width, y: 0.98333*height))
        path.addLine(to: CGPoint(x: 0.06276*width, y: 0.98968*height))
        path.addCurve(to: CGPoint(x: 0.0113*width, y: 0.85476*height), control1: CGPoint(x: 0.0364*width, y: 0.9754*height), control2: CGPoint(x: -0.01079*width, y: 0.92841*height))
        path.addCurve(to: CGPoint(x: 0.1046*width, y: 0.84365*height), control1: CGPoint(x: 0.02552*width, y: 0.8127*height), control2: CGPoint(x: 0.08912*width, y: 0.83254*height))
        path.addCurve(to: CGPoint(x: 0.16067*width, y: 0.79365*height), control1: CGPoint(x: 0.12008*width, y: 0.85476*height), control2: CGPoint(x: 0.13766*width, y: 0.85635*height))
        path.addCurve(to: CGPoint(x: 0.21423*width, y: 0.79365*height), control1: CGPoint(x: 0.1728*width, y: 0.75714*height), control2: CGPoint(x: 0.20251*width, y: 0.78016*height))
        path.addCurve(to: CGPoint(x: 0.26862*width, y: 0.80397*height), control1: CGPoint(x: 0.22594*width, y: 0.80714*height), control2: CGPoint(x: 0.24728*width, y: 0.8373*height))
        path.addCurve(to: CGPoint(x: 0.34979*width, y: 0.75635*height), control1: CGPoint(x: 0.28996*width, y: 0.77063*height), control2: CGPoint(x: 0.32218*width, y: 0.68254*height))
        path.addCurve(to: CGPoint(x: 0.44686*width, y: 0.8246*height), control1: CGPoint(x: 0.37741*width, y: 0.83016*height), control2: CGPoint(x: 0.39665*width, y: 0.89286*height))
        path.addCurve(to: CGPoint(x: 0.48912*width, y: 0.55714*height), control1: CGPoint(x: 0.49707*width, y: 0.75635*height), control2: CGPoint(x: 0.50042*width, y: 0.7*height))
        path.addCurve(to: CGPoint(x: 0.50209*width, y: 0.38175*height), control1: CGPoint(x: 0.47615*width, y: 0.4627*height), control2: CGPoint(x: 0.47782*width, y: 0.43571*height))
        path.addCurve(to: CGPoint(x: 0.55397*width, y: 0.34524*height), control1: CGPoint(x: 0.52636*width, y: 0.32778*height), control2: CGPoint(x: 0.52887*width, y: 0.31587*height))
        path.addCurve(to: CGPoint(x: 0.65481*width, y: 0.44841*height), control1: CGPoint(x: 0.57908*width, y: 0.3746*height), control2: CGPoint(x: 0.64184*width, y: 0.42698*height))
        path.addCurve(to: CGPoint(x: 0.69749*width, y: 0.54921*height), control1: CGPoint(x: 0.66778*width, y: 0.46984*height), control2: CGPoint(x: 0.68452*width, y: 0.50159*height))
        path.addCurve(to: CGPoint(x: 0.71088*width, y: 0.48095*height), control1: CGPoint(x: 0.71046*width, y: 0.59683*height), control2: CGPoint(x: 0.72762*width, y: 0.55159*height))
        path.addCurve(to: CGPoint(x: 0.72218*width, y: 0.24206*height), control1: CGPoint(x: 0.69414*width, y: 0.41032*height), control2: CGPoint(x: 0.66946*width, y: 0.33968*height))
        path.addCurve(to: CGPoint(x: 0.85565*width, y: 0.13016*height), control1: CGPoint(x: 0.7749*width, y: 0.14444*height), control2: CGPoint(x: 0.83933*width, y: 0.11429*height))
        path.addCurve(to: CGPoint(x: 0.98201*width, y: 0.14841*height), control1: CGPoint(x: 0.87197*width, y: 0.14603*height), control2: CGPoint(x: 0.96695*width, y: 0.21111*height))
        path.addCurve(to: CGPoint(x: 0.94561*width, y: 0.01111*height), control1: CGPoint(x: 0.99707*width, y: 0.08571*height), control2: CGPoint(x: 1.0113*width, y: 0.00635*height))
        path.addCurve(to: CGPoint(x: 0.7728*width, y: 0.09921*height), control1: CGPoint(x: 0.9*width, y: 0.01111*height), control2: CGPoint(x: 0.81967*width, y: 0.05*height))
        path.addCurve(to: CGPoint(x: 0.58117*width, y: 0.31984*height), control1: CGPoint(x: 0.73531*width, y: 0.13857*height), control2: CGPoint(x: 0.62943*width, y: 0.2627*height))
        path.addCurve(to: CGPoint(x: 0.51757*width, y: 0.50794*height), control1: CGPoint(x: 0.55983*width, y: 0.37619*height), control2: CGPoint(x: 0.51757*width, y: 0.44524*height))
        path.addCurve(to: CGPoint(x: 0.53431*width, y: 0.74762*height), control1: CGPoint(x: 0.51757*width, y: 0.57063*height), control2: CGPoint(x: 0.52887*width, y: 0.67407*height))
        path.addCurve(to: CGPoint(x: 0.51046*width, y: 0.80397*height), control1: CGPoint(x: 0.5364*width, y: 0.76376*height), control2: CGPoint(x: 0.53456*width, y: 0.79762*height))
        path.addCurve(to: CGPoint(x: 0.48033*width, y: 0.9381*height), control1: CGPoint(x: 0.49205*width, y: 0.80952*height), control2: CGPoint(x: 0.50628*width, y: 0.91429*height))
        path.addCurve(to: CGPoint(x: 0.3795*width, y: 0.98333*height), control1: CGPoint(x: 0.45439*width, y: 0.9619*height), control2: CGPoint(x: 0.41506*width, y: 0.98333*height))
        path.addCurve(to: CGPoint(x: 0.33515*width, y: 0.98333*height), control1: CGPoint(x: 0.35105*width, y: 0.98333*height), control2: CGPoint(x: 0.33808*width, y: 0.98333*height))
        return path
    }
}

#Preview {
    Suzuka()
}
