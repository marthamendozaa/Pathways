//
//  QuizResult.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftData
import Foundation

//Log of results in the profile
struct QuizResult: Identifiable, Hashable {
    var id = UUID()
    var dateTaken: Date
    var results: [CareerMatch] //Array of results

    init(dateTaken: Date = Date(), results: [CareerMatch] = []) {
        self.dateTaken = dateTaken
        self.results = results
    }
}

// Career and the percentaje of match
struct CareerMatch: Identifiable, Hashable {
    var id = UUID()
    var career: String
    var matchPercentage: Int

    init(career: String, matchPercentage: Int) {
        self.career = career
        self.matchPercentage = matchPercentage
    }
}


