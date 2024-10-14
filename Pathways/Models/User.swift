//
//  User.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftData

import Foundation

struct User {
    var id: UUID
    var name: String
    var quizResults: [QuizResult] //Array that holds multiple quiz results

    init(id: UUID = UUID(), name: String, quizResults: [QuizResult] = []) {
        self.id = id
        self.name = name
        self.quizResults = quizResults
    }
}
