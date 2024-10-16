//
//  CareerQuizModel.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import Foundation
import SwiftData


struct QuizAnswers: Identifiable, Hashable {
    var id = UUID()
    var answers: [Answer]
    var quizResult: QuizResult?

    init(answers: [Answer] = [], quizResult: QuizResult? = nil) {
        self.answers = answers
        self.quizResult = quizResult
    }
}

// Answers
@Model class Answer: Identifiable, Hashable {
    @Attribute var id = UUID()
    
    var questionId: Int
    var selectedOption: String

    init(questionId: Int, selectedOption: String) {
        self.id = UUID()
        self.questionId = questionId
        self.selectedOption = selectedOption
    }
}


