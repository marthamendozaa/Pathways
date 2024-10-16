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

    var body: some View {
        VStack {
            if currentQuestionIndex < questions.count {
                let question = questions[currentQuestionIndex]
                Text(question.text)
                    .font(.title)
                    .padding()
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
                            .padding()
                            .background(Color(red: 95/255, green: 85/255, blue: 216/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
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
    }
}
