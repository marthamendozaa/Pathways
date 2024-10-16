//
//  User.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import Foundation
import SwiftUI
import SwiftData

struct User: Identifiable, Hashable {
    var id = UUID()
    var quizAnswers: [QuizAnswers]

    init(quizAnswers: [QuizAnswers] = []) {
        self.quizAnswers = quizAnswers
    }
}

