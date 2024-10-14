//
//  ContentView.swift
//  Pathways
//
//  Created by Martha Mendoza Alfaro on 09/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var answers: [Answer]
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: Option?
    @State private var isQuizCompleted = false //Track quiz completion
    @State private var userName: String = "User" //Example user name but im not using it rn
    @State private var user: User? //Store the user instance

    var body: some View {
        NavigationView {
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
                                saveQuizResults() //save results when completed
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
                    //Navigate to ResultsView when done
                    NavigationLink(destination: ResultsView(answers: answers)
                                    .environment(\.modelContext, modelContext), isActive: $isQuizCompleted) {
                        EmptyView()
                    }
                }
                
                //Button to ProfileView
                NavigationLink(destination: ProfileView(user: user)) {
                    Text("View Profile")
                        .padding()
                        .background(Color(red: 95/255, green: 85/255, blue: 216/255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Career Quiz")
        }
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

    private func saveQuizResults() {
        let results = calculateCareerMatches(answers: answers)
        let quizResult = QuizResult(id: UUID(), dateTaken: Date(), results: results.map { CareerMatch(career: $0.key, matchPercentage: $0.value) })

        // Initialize the user instance
        user = User(id: UUID(), name: userName, quizResults: [quizResult])
    }

    private func calculateCareerMatches(answers: [Answer]) -> [String: Int] {
        var careerCounts: [String: Int] = [:]
        let totalAnswers = answers.count

        for answer in answers {
            if let question = questions.first(where: { $0.id == answer.questionId }),
               let option = question.options.first(where: { $0.text == answer.selectedOption }) {
                for career in option.careerPaths {
                    careerCounts[career, default: 0] += 1
                }
            }
        }

        var careerMatches: [String: Int] = [:]
        for (career, count) in careerCounts {
            let matchPercentage = (count * 100) / totalAnswers
            careerMatches[career] = matchPercentage
        }

        return careerMatches
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: [Answer.self])
    }
}
