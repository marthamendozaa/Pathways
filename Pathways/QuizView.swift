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
    @Query private var answers: [Answer]
    @Binding var user: User? //Bind to user from ContentView
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: Option?
    @State private var isQuizCompleted = false //Track quiz completion

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
                        saveAnswer(for: question, option: option)
                        currentQuestionIndex += 1

                        //Check if quiz is completed
                        if currentQuestionIndex == questions.count {
                            isQuizCompleted = true
                            //Quiz is complete n save answers for ResultsView
                        }
                    }) {
                        Text(option.text)
                            .padding()
                            .background(Color(red: 95/255, green: 85/255, blue: 216/255)) // Use the custom color
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
            } else if isQuizCompleted {
                //NavigationLink to ResultsView
                NavigationLink(destination: ResultsView(answers: answers)) {
                    Text("View Results")
                        .font(.title)
                        .padding()
                        .background(Color(red: 95/255, green: 85/255, blue: 216/255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .navigationTitle("Quiz")
    }

    private func saveAnswer(for question: Question, option: Option) {
        let answer = Answer(questionId: question.id, selectedOption: option.text)
        modelContext.insert(answer)
        do {
            try modelContext.save()
        } catch {
            print("Failed to save answer: \(error)")
        }
    }
}
