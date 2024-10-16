//
//  TextEffect.swift
//  PathwaysTest
//
//  Created by Martha Mendoza Alfaro on 16/10/24.
//

import SwiftUI

struct TextEffect: View {
    let text: String
    @State private var displayCharacters = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(displayCharacters)
            .bold()
            .onReceive(timer) { _ in
                if displayCharacters.count < text.count {
                    let index = text.index(text.startIndex, offsetBy:
                        displayCharacters.count)
                    displayCharacters.append(text[index])
                }
            
            }
    }
}


#Preview {
    TextEffect(text: "Hiiii how are you")
}
