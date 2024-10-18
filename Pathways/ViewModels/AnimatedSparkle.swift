//
//  AnimatedSparkle.swift
//  Pathways
//
//  Created by Martha Mendoza Alfaro on 17/10/24.
//

import SwiftUI

struct AnimatedImageView: View {
    let imageName: String
    let customColor: Color
    @State private var isRotating: Bool = false
    @State private var isScaling: Bool = false

    var body: some View {
        Image(systemName: imageName)
            .font(.largeTitle)
            .foregroundColor(customColor)
            .opacity(1)
            .rotationEffect(.degrees(isRotating ? 360 : 0))
            .scaleEffect(isScaling ? 1.2 : 1.0)
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isRotating)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isScaling)
            .onAppear {
                isRotating = true
                isScaling = true
            }
    }
}


struct AnimatedColorImageView: View {
    let imageName: String
    @State private var colorChange: Bool = false

    var body: some View {
        Image(systemName: imageName)
            .font(.title)
            .foregroundColor(colorChange ? .purple : .yellow)
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: colorChange)
            .onAppear {
                colorChange = true
            }
    }
}


struct AnimatedColorTextView: View {
    let textName: String
    @State private var colorChange: Bool = false

    var body: some View {
        Text(textName)
            .foregroundColor(colorChange ? .purple : .yellow)
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true), value: colorChange)
            .onAppear {
                colorChange = true
            }
    }
}
