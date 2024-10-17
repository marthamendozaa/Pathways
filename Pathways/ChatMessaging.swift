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
    
    var body: some View {
    if goTu {
        ContentView() 
        } else {
            VStack(spacing: 20) {
                // First set of messages with typing effect
                if showMessage1 {
                    TypingBubble(text: "Welcome Beautiful Soul", typedText: $typedMessage1)
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
                                Text("OHH YESS")
                                    .padding()
                                    .background(Color.green)
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
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        
                        
                        
                        Spacer()
                    }
                    .transition(.opacity)
                }
                
                // Second set of messages if Yes is pressed
                if showSecondMessages {
                    VStack(spacing: 10) {
                        TypingBubble(text: "Thats exactly what we want to hear", typedText: $typedMessage3)
                        TypingBubble(text: "Lets start by creating your profile together", typedText: $typedMessage4)
                        TypingBubble(text: "Once Completed we can start the journey", typedText: $typedMessage5)
                    }
                    .transition(.slide)
                    
                }
                
                // "Buy" messages if No is pressed
                if showBuyMessage {
                    VStack(spacing: 10) {
                        TypingBubble(text: "Yeah we can already say from your attitude that your future won't be that bright ..", typedText: $typedMessageBuy1)
                        TypingBubble(text: "JUST KIDDING LOLLL", typedText: $typedMessageBuy2)
                        TypingBubble(text: "Lets start by creating your profile together", typedText: $typedMessageBuy3)
                        TypingBubble(text: "Once Completed we can start the journey", typedText: $typedMessageBuy4)
                    }
                    .transition(.scale)
                }
                if createProfileButton {
                    Button(action: {
                        self.goTu = true
                        // On No, hide initial messages and show Buy message
                        withAnimation {
                            
                        }
                        //showNextMessages(withDelay: 2, isYes: false)
                    }) {
                        Text("CREATE PROFILE")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                
            }
            .padding()
            .onAppear {
                // Start showing the messages one by one with delays and typing effect
                showMessagesWithDelay()
            }
        }
    }
        
    
    // Function to control initial message appearance with delay
    func showMessagesWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                showMessage1 = true
            }
            typeMessage(text: "Welcome Beautiful Soul", into: $typedMessage1)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                showMessage2 = true
            }
            typeMessage(text: "Are you ready for discovering your bright future???", into: $typedMessage2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation {
                showButtons = true
            }
        }
    }
    
    // Function to simulate typing effect
    func typeMessage(text: String, into typedText: Binding<String>) {
        typedText.wrappedValue = ""
        let characters = Array(text)
        for (index, character) in characters.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                typedText.wrappedValue.append(character)
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
                typeMessage(text: "Thats exactly what we want to hear", into: $typedMessage3)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    typeMessage(text: "Lets start by creating your profile together", into: $typedMessage4)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    typeMessage(text: "Once Completed we can start the journey", into: $typedMessage5)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    createProfileButton = true
                }
                
            }
        } else {
            isYesButton = false
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation {
                    showBuyMessage = true
                }
                typeMessage(text: "Yeah we can already say from your attitude that your future won't be that bright ..", into: $typedMessageBuy1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    typeMessage(text: "JUST KIDDING LOLLL", into: $typedMessageBuy2)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    typeMessage(text: "Lets start by creating your profile together", into: $typedMessageBuy3)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                    typeMessage(text: "Once Completed we can start the journey", into: $typedMessageBuy4)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    createProfileButton = true
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
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
                .foregroundColor(.black)
                .frame(maxWidth: 250, alignment: .leading) // Limit the width of the bubble
            Spacer() // Push the bubble to the left
        }
        .padding(.leading)
    }
}

// Custom view for an outgoing chat bubble (right-aligned)
struct ChatBubbleOutgoing: View {
    var text: String
    
    var body: some View {
        HStack {
            Spacer() // Push the bubble to the right
            Text(text)
                .padding()
                .background(Color.blue.opacity(0.8)) // Different color for outgoing messages
                .cornerRadius(15)
                .foregroundColor(.white)
                .frame(maxWidth: 250, alignment: .leading) // Limit the width of the bubble
        }
        .padding(.trailing)
    }
}

struct ChatMessaging_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessaging()
    }
}

