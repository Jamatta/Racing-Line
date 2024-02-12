//
//  Spa.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 12.02.24.
//

import SwiftUI

struct Spa: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = 472.0
        let height = 232.0
        path.move(to: CGPoint(x: 0.20118*width, y: 0.7038*height))
        path.addCurve(to: CGPoint(x: 0.0202*width, y: 0.90082*height), control1: CGPoint(x: 0.14239*width, y: 0.76902*height), control2: CGPoint(x: 0.0239*width, y: 0.89973*height))
        path.addCurve(to: CGPoint(x: 0.01515*width, y: 0.84103*height), control1: CGPoint(x: 0.01557*width, y: 0.90217*height), control2: CGPoint(x: -0.00674*width, y: 0.91848*height))
        path.addCurve(to: CGPoint(x: 0.12963*width, y: 0.57473*height), control1: CGPoint(x: 0.03704*width, y: 0.76359*height), control2: CGPoint(x: 0.06271*width, y: 0.67663*height))
        path.addCurve(to: CGPoint(x: 0.19739*width, y: 0.44429*height), control1: CGPoint(x: 0.19655*width, y: 0.47283*height), control2: CGPoint(x: 0.1936*width, y: 0.45788*height))
        path.addCurve(to: CGPoint(x: 0.24327*width, y: 0.3947*height), control1: CGPoint(x: 0.20118*width, y: 0.43071*height), control2: CGPoint(x: 0.21759*width, y: 0.39402*height))
        path.addCurve(to: CGPoint(x: 0.32744*width, y: 0.31861*height), control1: CGPoint(x: 0.26894*width, y: 0.39538*height), control2: CGPoint(x: 0.28872*width, y: 0.3784*height))
        path.addCurve(to: CGPoint(x: 0.52483*width, y: 0.16168*height), control1: CGPoint(x: 0.36616*width, y: 0.25883*height), control2: CGPoint(x: 0.42382*width, y: 0.2106*height))
        path.addCurve(to: CGPoint(x: 0.76136*width, y: 0.01155*height), control1: CGPoint(x: 0.60362*width, y: 0.11332*height), control2: CGPoint(x: 0.71535*width, y: 0.04144*height))
        path.addCurve(to: CGPoint(x: 0.79251*width, y: 0.02582*height), control1: CGPoint(x: 0.76838*width, y: 0.00793*height), control2: CGPoint(x: 0.78443*width, y: 0.00571*height))
        path.addCurve(to: CGPoint(x: 0.80766*width, y: 0.05503*height), control1: CGPoint(x: 0.80059*width, y: 0.04592*height), control2: CGPoint(x: 0.80598*width, y: 0.05367*height))
        path.addCurve(to: CGPoint(x: 0.8367*width, y: 0.05027*height), control1: CGPoint(x: 0.81145*width, y: 0.05978*height), control2: CGPoint(x: 0.82256*width, y: 0.06549*height))
        path.addCurve(to: CGPoint(x: 0.88973*width, y: 0.03465*height), control1: CGPoint(x: 0.85438*width, y: 0.03125*height), control2: CGPoint(x: 0.87458*width, y: 0.00679*height))
        path.addCurve(to: CGPoint(x: 0.99285*width, y: 0.22826*height), control1: CGPoint(x: 0.90185*width, y: 0.05693*height), control2: CGPoint(x: 0.96353*width, y: 0.17301*height))
        path.addCurve(to: CGPoint(x: 0.98906*width, y: 0.26563*height), control1: CGPoint(x: 0.99453*width, y: 0.23573*height), control2: CGPoint(x: 0.99613*width, y: 0.25367*height))
        path.addCurve(to: CGPoint(x: 0.95034*width, y: 0.26563*height), control1: CGPoint(x: 0.98022*width, y: 0.28057*height), control2: CGPoint(x: 0.96801*width, y: 0.30299*height))
        path.addCurve(to: CGPoint(x: 0.90152*width, y: 0.17188*height), control1: CGPoint(x: 0.9362*width, y: 0.23573*height), control2: CGPoint(x: 0.91189*width, y: 0.19067*height))
        path.addCurve(to: CGPoint(x: 0.87247*width, y: 0.18139*height), control1: CGPoint(x: 0.89843*width, y: 0.16848*height), control2: CGPoint(x: 0.8883*width, y: 0.16562*height))
        path.addCurve(to: CGPoint(x: 0.68476*width, y: 0.28057*height), control1: CGPoint(x: 0.85269*width, y: 0.20109*height), control2: CGPoint(x: 0.77231*width, y: 0.25136*height))
        path.addCurve(to: CGPoint(x: 0.63931*width, y: 0.36073*height), control1: CGPoint(x: 0.65783*width, y: 0.28872*height), control2: CGPoint(x: 0.64015*width, y: 0.30774*height))
        path.addCurve(to: CGPoint(x: 0.67803*width, y: 0.49728*height), control1: CGPoint(x: 0.63847*width, y: 0.41372*height), control2: CGPoint(x: 0.63552*width, y: 0.46875*height))
        path.addCurve(to: CGPoint(x: 0.83838*width, y: 0.57677*height), control1: CGPoint(x: 0.71204*width, y: 0.52011*height), control2: CGPoint(x: 0.7991*width, y: 0.55978*height))
        path.addCurve(to: CGPoint(x: 0.86827*width, y: 0.6413*height), control1: CGPoint(x: 0.85213*width, y: 0.58356*height), control2: CGPoint(x: 0.87736*width, y: 0.60598*height))
        path.addCurve(to: CGPoint(x: 0.86827*width, y: 0.75068*height), control1: CGPoint(x: 0.8569*width, y: 0.68546*height), control2: CGPoint(x: 0.84386*width, y: 0.72826*height))
        path.addCurve(to: CGPoint(x: 0.96296*width, y: 0.83288*height), control1: CGPoint(x: 0.88779*width, y: 0.76861*height), control2: CGPoint(x: 0.93954*width, y: 0.81295*height))
        path.addCurve(to: CGPoint(x: 0.96717*width, y: 0.88315*height), control1: CGPoint(x: 0.96759*width, y: 0.84013*height), control2: CGPoint(x: 0.97492*width, y: 0.86033*height))
        path.addCurve(to: CGPoint(x: 0.91709*width, y: 0.98573*height), control1: CGPoint(x: 0.95943*width, y: 0.90598*height), control2: CGPoint(x: 0.93056*width, y: 0.96105*height))
        path.addCurve(to: CGPoint(x: 0.85017*width, y: 0.97418*height), control1: CGPoint(x: 0.91077*width, y: 0.9914*height), control2: CGPoint(x: 0.88855*width, y: 0.99701*height))
        path.addCurve(to: CGPoint(x: 0.67214*width, y: 0.69361*height), control1: CGPoint(x: 0.80219*width, y: 0.94565*height), control2: CGPoint(x: 0.75968*width, y: 0.90557*height))
        path.addCurve(to: CGPoint(x: 0.47559*width, y: 0.58764*height), control1: CGPoint(x: 0.61616*width, y: 0.56386*height), control2: CGPoint(x: 0.4979*width, y: 0.56929*height))
        path.addCurve(to: CGPoint(x: 0.33418*width, y: 0.6875*height), control1: CGPoint(x: 0.45328*width, y: 0.60598*height), control2: CGPoint(x: 0.39394*width, y: 0.6712*height))
        path.addCurve(to: CGPoint(x: 0.26178*width, y: 0.7038*height), control1: CGPoint(x: 0.28636*width, y: 0.70054*height), control2: CGPoint(x: 0.26599*width, y: 0.7038*height))
        path.addCurve(to: CGPoint(x: 0.24958*width, y: 0.67391*height), control1: CGPoint(x: 0.258*width, y: 0.70471*height), control2: CGPoint(x: 0.25025*width, y: 0.7*height))
        path.addCurve(to: CGPoint(x: 0.22811*width, y: 0.6644*height), control1: CGPoint(x: 0.24874*width, y: 0.6413*height), control2: CGPoint(x: 0.23569*width, y: 0.65489*height))
        path.addCurve(to: CGPoint(x: 0.20244*width, y: 0.70313*height), control1: CGPoint(x: 0.22054*width, y: 0.67391*height), control2: CGPoint(x: 0.22096*width, y: 0.68207*height))
        return path
    }
}

#Preview {
    Spa()
}
