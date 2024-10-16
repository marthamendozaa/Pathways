//
//  User.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftData

import Foundation

struct User: Identifiable, Hashable {
    var id = UUID()
    //var name: String
    var quizResults: [QuizResult] //Array that holds multiple quiz results

    init(quizResults: [QuizResult] = []) {
        //self.name = name
        self.quizResults = quizResults
    }
}
