//
//  AnyShapeConverter.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 11.02.24.
//

import SwiftUI

struct AnyShape: Shape {
    private let _path: (CGRect) -> Path
    
    init<S:Shape> (_ wraped: S) {
        _path = wraped.path(in:)
    }
    
    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}
