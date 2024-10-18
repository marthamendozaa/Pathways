//
//  UserData.swift
//  Pathways
//
//  Created by Martha Mendoza Alfaro on 15/10/24.
//

import Foundation
import SwiftUI
import SwiftData

class UserData: ObservableObject {
    @Published var user: User? = User()
    @Published var perfectMatchCareer: String?
    
    func startNewQuiz() {
        user?.quizAnswers.append(QuizAnswers(answers: []))
    }

    func saveAnswer(for question: Question, option: Option, modelContext: ModelContext) {
        guard let currentQuizIndex = user?.quizAnswers.count, currentQuizIndex > 0 else {
            print("No active quiz found.")
            return
        }
        
        let answer = Answer(questionId: question.order, selectedOption: option.text)
        modelContext.insert(answer)
        do {
            try modelContext.save()
            user?.quizAnswers[currentQuizIndex - 1].answers.append(answer)
        } catch {
            print("Failed to save answer: \(error)")
        }
    }
    
    func saveQuizResults(userName: String) {
        guard let currentQuizIndex = user?.quizAnswers.count, currentQuizIndex > 0 else {
            print("No active quiz found.")
            return
        }

        let currentAnswers = user?.quizAnswers[currentQuizIndex - 1].answers ?? []
        let results = calculateCareerMatches(answers: currentAnswers)
        let careerMatches = results.map { CareerMatch(career: $0.key, matchPercentage: $0.value) }
        
        // Sort the results before saving
        let sortedCareerMatches = careerMatches.sorted { $0.matchPercentage > $1.matchPercentage }

        let quizResult = QuizResult(dateTaken: Date(), results: sortedCareerMatches)
        user?.quizAnswers[currentQuizIndex - 1].quizResult = quizResult
    }

    
    private func calculateCareerMatches(answers: [Answer]) -> [String: Int] {
        var careerCounts: [String: Int] = [:]
        let totalAnswers = answers.count

        for answer in answers {
            if let question = questions.first(where: { $0.order == answer.questionId }),
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

struct User: Identifiable, Hashable {
    var id = UUID()
    var quizAnswers: [QuizAnswers]

    init(quizAnswers: [QuizAnswers] = []) {
        self.quizAnswers = quizAnswers
    }
}

