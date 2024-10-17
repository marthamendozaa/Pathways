import SwiftUI

struct ChatMessaging: View {
    // States for controlling visibility of messages and buttons
    @State private var showMessage1 = false
    @State private var showMessage2 = false
    @State private var showButtons = false
    @State private var showSecondMessages = false
    @State private var showBuyMessage = false
    @State private var createProfileButton = false
    @State private var isYesButton = true
    @State private var isNoButton = true
    @State private var goTu = false
    
    // State variables for typing effect
    @State private var typedMessage1 = ""
    @State private var typedMessage2 = ""
    @State private var typedMessage3 = ""
    @State private var typedMessage4 = ""
    @State private var typedMessage5 = ""
    @State private var typedMessageBuy1 = ""
    @State private var typedMessageBuy2 = ""
    @State private var typedMessageBuy3 = ""
    @State private var typedMessageBuy4 = ""
    
    let customPurple = Color(red: 95/255, green: 85/255, blue: 216/255)
    let customDarkPurple = Color(red: 57/255, green: 50/255, blue: 135/255)
    
    var body: some View {
        ZStack {
            customPurple
                .ignoresSafeArea()
            
            if goTu {
                ContentView() // Replace with your destination view if needed
            } else {
                
                VStack(spacing: 20) {
                   
                    Text("TEAM PATHWAYS")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    // First set of messages with typing effect
                    if showMessage1 {
                        TypingBubble(text: "Welcome Beautiful Soul❤️", typedText: $typedMessage1)
                            .transition(.opacity)
                    }
                    
                    if showMessage2 {
                        TypingBubble(text: "Are you ready for discovering your bright future???", typedText: $typedMessage2)
                            .transition(.opacity)
                    }
                    
                    // Yes and No Buttons
                    if showButtons {
                        HStack {
                            if isYesButton {
                                Button(action: {
                                    // On Yes, hide initial messages and show second set
                                    withAnimation {
                                        showSecondMessages = true
                                        showBuyMessage = false
                                    }
                                    showNextMessages(withDelay: 2, isYes: true)
                                }) {
                                    Text("OHH YESS!")
                                        .font(.system(size: 16, weight: .bold))
                                        .padding()
                                        .background(customDarkPurple)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            
                            if isNoButton {
                                Button(action: {
                                    // On No, hide initial messages and show Buy message
                                    withAnimation {
                                        showSecondMessages = false
                                        showBuyMessage = true
                                    }
                                    showNextMessages(withDelay: 2, isYes: false)
                                }) {
                                    Text("HELL NAH!")
                                        .font(.system(size: 16, weight: .bold))
                                        .padding()
                                        .background(customDarkPurple)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 18)
                        .transition(.opacity)
                    }
                    
                    // Second set of messages if Yes is pressed
                    if showSecondMessages {
                        VStack(spacing: 10) {
                            if !typedMessage3.isEmpty {
                                TypingBubble(text: "Thats exactly what we want to hear ⭐️⭐️⭐️", typedText: $typedMessage3)
                            }
                            
                            if !typedMessage4.isEmpty {
                                TypingBubble(text: "Lets start this Journey together 😊", typedText: $typedMessage4)
                            }
                        }
                        .transition(.slide)
                    }
                    
                    // "Buy" messages if No is pressed
                    if showBuyMessage {
                        VStack(spacing: 10) {
                            if !typedMessageBuy1.isEmpty {
                                TypingBubble(text: "Yeah we can already say from your attitude that your future won't be that bright ..", typedText: $typedMessageBuy1)
                            }
                            if !typedMessageBuy2.isEmpty {
                                TypingBubble(text: "JUST KIDDING LOLLL 😂😂", typedText: $typedMessageBuy2)
                            }
                            if !typedMessageBuy3.isEmpty {
                                TypingBubble(text: "Lets start this Journey together 😊", typedText: $typedMessageBuy3)
                            }
                        }
                        .transition(.scale)
                    }
                    
                    // Create Profile button
                    if createProfileButton {
                        Button(action: {
                            self.goTu = true
                        }) {
                            Text("CREATE PROFILE")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 95/255, green: 85/255, blue: 216/255))
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .onAppear {
                    // Start showing the messages one by one with delays and typing effect
                    showMessagesWithDelay()
                }
            }
        }
    }
    
    // Function to control initial message appearance with delay
    func showMessagesWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                showMessage1 = true
            }
            typeMessage(text: "Welcome Beautiful Soul ❤️", into: $typedMessage1) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showMessage2 = true
                    }
                    typeMessage(text: "Are you ready for discovering your bright future???", into: $typedMessage2) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                showButtons = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Function to control second set of messages or buy message based on button click
    func showNextMessages(withDelay delay: Double, isYes: Bool) {
        if isYes {
            isNoButton = false
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation {
                    showSecondMessages = true
                }
                // Start typing first message
                typeMessage(text: "Thats exactly what we want to hear ⭐️⭐️⭐️", into: $typedMessage3) {
                    // Once the first message is done typing, start typing the second message
                    typeMessage(text: "Lets start this Journey together 😊", into: $typedMessage4) {
                        // Once second message is done typing, show the create profile button
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            createProfileButton = true
                        }
                    }
                }
            }
        } else {
            isYesButton = false
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation {
                    showBuyMessage = true
                }
                // Start typing first "No" response message
                typeMessage(text: "Yeah we can already say from your attitude that your future won't be that bright ..", into: $typedMessageBuy1) {
                    // Once the first "No" message is done typing, start the second
                    typeMessage(text: "JUST KIDDING LOLLL 😂😂", into: $typedMessageBuy2) {
                        // Then start the third message after the second one finishes
                        typeMessage(text: "Lets start this Journey together 😊", into: $typedMessageBuy3) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                createProfileButton = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Function to simulate typing effect with completion handler
    func typeMessage(text: String, into typedText: Binding<String>, completion: @escaping () -> Void) {
        typedText.wrappedValue = ""
        let characters = Array(text)
        
        // Typing effect: each character appears one after the other
        for (index, character) in characters.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                typedText.wrappedValue.append(character)
                
                // Call completion when the entire message has been typed
                if index == characters.count - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        completion()
                    }
                }
            }
        }
    }
}

// Custom view for a typing effect in a chat bubble (left-aligned)
struct TypingBubble: View {
    var text: String
    @Binding var typedText: String
    
    var body: some View {
        HStack {
            Text(typedText)
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .foregroundColor(.black)
                .frame(maxWidth: 250, alignment: .leading) // Limit the width of the bubble
            Spacer() // Push the bubble to the left
        }
        .padding(.leading)
    }
}

struct ChatMessaging_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessaging()
    }
}

