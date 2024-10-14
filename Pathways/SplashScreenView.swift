//
//  SplashScreenView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI

struct SplashScreenView: View {
    //Tell the program if the screen is active or nah
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color(red: 95/255, green: 85/255, blue: 216/255)
                //"#5F55D8" hex color
                
                .ignoresSafeArea()
            
                VStack {
                    Image("Logo")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    Text("Pathways")
                        .font(Font.custom("Baskerville-Bold", size:26))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
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
