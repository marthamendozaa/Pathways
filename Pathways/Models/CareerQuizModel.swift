//
//  CareerQuizModel.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import Foundation
import SwiftData


@Model class Answer {
    @Attribute var id: UUID
    var questionId: Int
    var selectedOption: String

    init(questionId: Int, selectedOption: String) {
        self.id = UUID()
        self.questionId = questionId
        self.selectedOption = selectedOption
    }
}

