//
//  Pie.swift
//  Mindji
//
//  Created by Antonela Madalina on 03/10/2020.
//  Copyright © 2020 am.p. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )
        
        var path = Path()
        path.move(to: center)
        path.addLine(to: start)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: clockwise)
        path.addLine(to: center)
        return path
    }
    
    
}

