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
    @EnvironmentObject var userData: UserData
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: Option?
    @State private var isQuizCompleted = false

    let customPurple = Color(red: 95/255, green: 85/255, blue: 216/255)

    var body: some View {
        
        ZStack {
            
            VStack {
                
                if currentQuestionIndex < questions.count {
                    
                    let question = questions[currentQuestionIndex]
                    
                    Spacer()
                    
                    Text(question.text)
                        .font(.largeTitle.weight(.bold))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Image(systemName: question.imageName) // Add the image here
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(customPurple)
                        .frame(width: 100, height: 100) // Adjust size as needed
                        .padding()
                    
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
                                    //.lineLimit(1)
                                    //.minimumScaleFactor(0.5)
                            }
                            //.padding(.top)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    ProgressView(value: Double(currentQuestionIndex), total: Double(questions.count))
                            .progressViewStyle(LinearProgressViewStyle())
                            .frame(height: 0) // Set height for the progress bar
                            .padding() // Add padding around the progress bar

                    
                } else if isQuizCompleted {
                    Text("Quiz Completed")
                        .font(.title)
                        .padding()
                    NavigationLink(destination: ResultsView().environmentObject(userData)) {
                        Text("View Results")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
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

