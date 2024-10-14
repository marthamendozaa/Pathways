//
//  QuizData.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import Foundation

struct Question {
    let id: Int
    let text: String
    let options: [Option]
}

struct Option {
    let text: String
    let careerPaths: [String]
}

let questions: [Question] = [
    Question(id: 1, text: "What do you enjoy doing the most?", options: [
        Option(text: "Helping people", careerPaths: ["Doctor", "Scientific"]),
        Option(text: "Designing buildings", careerPaths: ["Architect"]),
        Option(text: "Writing code", careerPaths: ["Programmer"]),
        Option(text: "Doing experiments", careerPaths: ["Scientific"])
    ]),
    Question(id: 2, text: "What are you most passionate about?", options: [
        Option(text: "Medicine", careerPaths: ["Doctor"]),
        Option(text: "Technology", careerPaths: ["Programmer"]),
        Option(text: "Art", careerPaths: ["Architect"]),
        Option(text: "Research", careerPaths: ["Scientific"])
    ]),
    // Add more questions as needed
]
