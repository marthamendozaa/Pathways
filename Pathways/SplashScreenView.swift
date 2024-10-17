//
//  SplashScreenView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI

struct SplashScreenView: View {
    // Tell the program if the screen is active or not
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var offsetY: CGFloat = 0.0
    @State private var showButton = false

    var body: some View {
        if isActive {
            ChatMessaging() // This screen will appear only after the button is tapped
        } else {
            ZStack {
                Color(red: 95/255, green: 85/255, blue: 216/255)
                    .ignoresSafeArea()

                VStack(spacing: 27) { // Add spacing between elements
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 250) // Adjusted image size
                        .foregroundColor(.blue)
                    
                    Text("Pathways")
                        .font(.system(size: 55, weight: .bold).weight(.bold))
                        .foregroundColor(.white) // White text color
                }
                .scaleEffect(size)
                .opacity(opacity)
                .offset(y: offsetY)
                .onAppear {
                    // Animate size and opacity over 2 seconds
                    withAnimation(.easeIn(duration: 2.0)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                    // Move the text and image upwards slightly after animation
                    withAnimation(.easeInOut(duration: 1.0).delay(2.0)) {
                        self.offsetY = -30 // Move upwards
                    }
                    // Show the button after a delay of 1 second after the upward movement
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.showButton = true // Show button with fade-in
                        }
                    }
                }

                // "Get Started" button
                if showButton {
                    Button(action: {
                        self.isActive = true // Navigate to the next screen
                    }) {
                        Button(action: {
                            self.isActive = true // Navigate to the next screen
                        }) {
                            Text("Start Now")
                                .font(.system(size: 26, weight: .bold)) // Increased font size and made it bold
                                .foregroundColor(Color(red: 95/255, green: 85/255, blue: 216/255)) // Purple text color
                                .padding(25)
                                .background(Color.white)
                                .cornerRadius(30)
                        }
                    }
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5))
                    .offset(y: 230) // Positioning the button below the text and image
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
