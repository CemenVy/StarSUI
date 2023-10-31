//
//  StarPathView.swift
//  StarSUI
//
//  Created by Семен Выдрин on 31.10.2023.
//

import SwiftUI

struct StarPathView: View {
    let colors: [Color]
    let colorLine: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            let minimumSize = min(width,height)
            let nearLine = minimumSize * 0.1
            let middle = minimumSize / 2
            let quarter = middle / 2
            
            let outerStarPoint = minimumSize * 0.15
            let innerStarPoint = minimumSize * 0.175
            
            // Основная звезда
            Path { path in
                createStarPath(in: &path, with: width, and: height)
            }
            .fill(
                RadialGradient(
                    colors: colors,
                    center: .leading,
                    startRadius: 0.5,
                    endRadius: 200
                )
            )
            
            // Четыре линии от внутренних вершин
            drawLine(at: CGPoint(x: middle + innerStarPoint, y: middle - outerStarPoint),
                     to: CGPoint(x: middle + quarter, y: middle + nearLine))
            drawLine(at: CGPoint(x: middle + innerStarPoint, y: middle - outerStarPoint),
                     to: CGPoint(x: middle, y: middle + quarter))
            drawLine(at: CGPoint(x: middle + innerStarPoint, y: middle - outerStarPoint),
                     to: CGPoint(x: middle - quarter, y: middle + nearLine))
            drawLine(at: CGPoint(x: middle + innerStarPoint, y: middle - outerStarPoint),
                     to: CGPoint(x: middle - innerStarPoint, y: middle - outerStarPoint))
            
            // Звезда для создания контура
            Path { path in
                createStarPath(in: &path, with: width, and: height)
            }
            .stroke(colorLine,
                    style: StrokeStyle(lineWidth: 4))
        }
    }
    
    private func createStarPath(in path: inout Path, with width: CGFloat, and height: CGFloat) {
        let width = width
        let height = height
        
        let minimumSize = min(width,height)
        let nearLine = minimumSize * 0.1
        let farLine = minimumSize - nearLine
        let middle = minimumSize / 2
        let quarter = middle / 2
        
        let pointOne = minimumSize * 0.15
        let pointTwo = minimumSize * 0.175
        
        path.addLines([
            CGPoint(x: middle, y: nearLine),
            CGPoint(x: middle + pointTwo, y: middle - pointOne),
            CGPoint(x: farLine, y: middle - nearLine),
            CGPoint(x: middle + quarter, y: middle + nearLine),
            CGPoint(x: middle + quarter, y: farLine),
            CGPoint(x: middle, y: middle + quarter),
            CGPoint(x: middle - quarter, y: farLine),
            CGPoint(x: middle - quarter, y: middle + nearLine),
            CGPoint(x: nearLine, y: middle - nearLine),
            CGPoint(x: middle - pointTwo, y: middle - pointOne)
        ])
        path.closeSubpath()
    }
    
    private func drawLine(at start: CGPoint, to end: CGPoint) -> some View {
        Path { path in
            path.move(to: start)
            path.addLine(to: end)
        }
        .stroke(colorLine, style: StrokeStyle(lineWidth: 4))
    }
    
}

struct StarPathView_Previews: PreviewProvider {
    static var previews: some View {
        StarPathView(colors: [.red, .green], colorLine: .yellow)
            .frame(width: 200, height: 200)
    }
}
