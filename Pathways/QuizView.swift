//
//  QuizView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI
import SwiftData

struct QuizView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var userData: UserData //@Query en vez de environment object??? si si,
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: Option?
    @State private var isQuizCompleted = false
    
    @State private var progress: Double = 0.0
    @State private var colorChange = false
    @State private var isRotating = false
    @State private var isScaling = false
    @State private var showButton = false
    

    let customPurple = Color(red: 95/255, green: 85/255, blue: 216/255)

    var body: some View {
        
        ZStack {
            
            
            VStack {
                
                if currentQuestionIndex < questions.count {
                    
                    let question = questions[currentQuestionIndex]
                    
                    Spacer()
                    
                    Text(question.text)
                        .font(.largeTitle.weight(.bold))
                        //.padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        //.lineLimit(nil)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Image(systemName: question.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100) //
                        //.symbolEffect(.bounce)
                        .padding([.leading, .bottom, .trailing], 20.0)
                    
                    let columns = [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(question.options, id: \.text) { option in
                            Button(action: {
                                
                                selectedOption = option
                                userData.saveAnswer(for: question, option: option, modelContext: modelContext)
                                currentQuestionIndex += 1
                                
                                if currentQuestionIndex == questions.count {
                                    isQuizCompleted = true
                                    userData.saveQuizResults(userName: "User")
                                }
                            }) {
                                Text(option.text)
                                    .font(.headline)
                                
                                    .padding()
                                    .frame(width: 150, height: 150)
                                    .background(Color(red: 95/255, green: 85/255, blue: 216/255))
                                    
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    //.lineLimit(1)
                                    //.minimumScaleFactor(0.5)
                            }
                            //.padding(.top)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    ProgressView(value: Double(currentQuestionIndex+1), total: Double(questions.count))
                            .progressViewStyle(LinearProgressViewStyle())
                            .frame(height: 0) // Set height for the progress bar
                            .padding() // Add padding around the progress bar

                    
                } else if isQuizCompleted {
                    
                    HStack {
                        AnimatedImageView(imageName: "sparkle", customColor: customPurple)
                        
                        Text("Quiz Completed")
                            .font(.largeTitle.weight(.bold))
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        AnimatedImageView(imageName: "sparkle", customColor: customPurple)
                    }
                    
                    
                    LoadingEffect()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                                withAnimation {
                                    showButton = true
                                }
                            }
                        }
                    
                    
                    if showButton {
                        NavigationLink(destination: ResultsView().environmentObject(userData)) {
                            Text("View Results")
                                .padding(20)
                                .font(.title.weight(.bold))
                                .background(customPurple)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                                
                        }
                        
                    }
                }
            }
            .padding()
            .onAppear {
                userData.startNewQuiz()
            }
        }
    }
}



struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return QuizView()
            .environmentObject(userData)
            .modelContainer(for: [Answer.self])
    }
}

