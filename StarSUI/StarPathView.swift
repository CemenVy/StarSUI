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
            let farLine = minimumSize - nearLine
            let middle = minimumSize / 2
            let quarter = middle / 2
            
            let pointOne = minimumSize * 0.15
            let pointTwo = minimumSize * 0.175
            
            Path { path in
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
            }
            .fill(
                RadialGradient(
                    colors: colors,
                    center: .leading,
                    startRadius: 0.5,
                    endRadius: 200
                )
            )
            
            Path { path in
                path.move(to: CGPoint(x: middle + pointTwo, y: middle - pointOne))
                path.addLine(to: CGPoint(x: middle + quarter, y: middle + nearLine))
            }
            .stroke(colorLine,
            style: StrokeStyle(lineWidth: 4))
            
            Path { path in
                path.move(to: CGPoint(x: middle + pointTwo, y: middle - pointOne))
                path.addLine(to: CGPoint(x: middle, y: middle + quarter))
            }
            .stroke(colorLine,
            style: StrokeStyle(lineWidth: 4))

            
            Path { path in
                path.move(to: CGPoint(x: middle + pointTwo, y: middle - pointOne))
                path.addLine(to: CGPoint(x: middle - quarter, y: middle + nearLine))
            }
            .stroke(colorLine,
            style: StrokeStyle(lineWidth: 4))
            
            Path { path in
                path.move(to: CGPoint(x: middle + pointTwo, y: middle - pointOne))
                path.addLine(to: CGPoint(x: middle - pointTwo, y: middle - pointOne))
            }
            .stroke(colorLine,
            style: StrokeStyle(lineWidth: 4))
            
            Path { path in
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
            .stroke(colorLine,
            style: StrokeStyle(lineWidth: 4))
        }
    }
    
}

struct StarPathView_Previews: PreviewProvider {
    static var previews: some View {
        StarPathView(colors: [.red, .green], colorLine: .yellow)
            .frame(width: 200, height: 200)
    }
}
