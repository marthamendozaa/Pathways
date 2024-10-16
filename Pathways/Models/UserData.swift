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
    @Published var user: User? = nil
    @Published var answers: [Answer] = []
    
    func saveAnswer(for question: Question, option: Option, modelContext: ModelContext) {
        let answer = Answer(questionId: question.order, selectedOption: option.text)
        modelContext.insert(answer)
        do {
            try modelContext.save()
            answers.append(answer)
        } catch {
            print("Failed to save answer: \(error)")
        }
    }
    
    func saveQuizResults(userName: String) {
        let results = calculateCareerMatches(answers: answers)
        let quizResult = QuizResult(dateTaken: Date(), results: results.map { CareerMatch(career: $0.key, matchPercentage: $0.value) })
        user = User( quizResults: [quizResult])
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
