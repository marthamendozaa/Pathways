//
//  QuizResult.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftData
import Foundation

struct QuizResult {
    var id: UUID
    var dateTaken: Date
    var results: [CareerMatch] //Array of results

    init(id: UUID = UUID(), dateTaken: Date = Date(), results: [CareerMatch] = []) {
        self.id = id
        self.dateTaken = dateTaken
        self.results = results
    }
}

struct CareerMatch {
    var career: String
    var matchPercentage: Int

    init(career: String, matchPercentage: Int) {
        self.career = career
        self.matchPercentage = matchPercentage
    }
}
