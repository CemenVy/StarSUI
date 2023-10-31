//
//  ContentView.swift
//  StarSUI
//
//  Created by Семен Выдрин on 31.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var awardIsShowing = false
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                if awardIsShowing {
                    StarPathView(colors: [.white, .yellow], colorLine: .black)
                        .frame(width: 250, height: 250)
                        .transition(.customTransition)
                } else {
                    StarPathView(colors: [.black], colorLine: .yellow)
                        .frame(width: 250, height: 250)
                        .transition(.customTransition)
                }
            }
            
            Spacer()
            
            Button(action: buttonAction) {
                Text(awardIsShowing ? "Black" : "Yellow")
            }
            .padding(.bottom, 100)
        }
    }
    
    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
        }
    }
}

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: scale)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: scale)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

#Preview {
    ContentView()
}
