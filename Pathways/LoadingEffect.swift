//
//  LoadingEffect.swift
//  PathwaysTest
//
//  Created by Martha Mendoza Alfaro on 16/10/24.
//

import SwiftUI

struct LoadingEffect: View {
    @State private var rotation: Double = 0
    @State private var x: CGFloat = 0.0
    @State private var showText: Bool = false
    
    let customPurple = Color(red: 95/255, green: 85/255, blue: 216/255)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0, to: x)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(customPurple)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 2.0), value: x) // Complete in 2 seconds
                .onAppear {
                    withAnimation(.linear(duration: 2.0)) {
                        self.x = 1.0
                    }
                    // Delay showing the text by the duration of the animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.showText = true
                    }
                }
            
            if showText {
                TextEffect(text: "100%")
                    .font(.title)
                    .foregroundColor(.black)
                    .transition(.opacity)
                    
            }
        }
        .compositingGroup()
        .frame(width: 200)
    }
}

struct LoadingEffect_Previews: PreviewProvider {
    static var previews: some View {
        LoadingEffect()
    }
}
