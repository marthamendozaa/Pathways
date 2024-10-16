//
//  QuizData.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import Foundation

// Each question
struct Question: Identifiable {
    let id = UUID()
    let order: Int
    let text: String
    let options: [Option]
    var imageName: String
}

// Each option of the question
struct Option: Identifiable {
    var id = UUID()
    let text: String
    let careerPaths: [String]
}

let questions: [Question] = [
    Question(order: 1, text: "What do you enjoy doing the most?", options: [
        Option(text: "Helping people", careerPaths: ["Doctor", "Scientist"]),
        Option(text: "Designing buildings", careerPaths: ["Architect"]),
        Option(text: "Writing code", careerPaths: ["Programmer"]),
        Option(text: "Doing experiments", careerPaths: ["Scientist"])
    ], imageName: "paintbrush"),
    Question(order: 2, text: "What are you most passionate about?", options: [
        Option(text: "Medicine", careerPaths: ["Doctor"]),
        Option(text: "Technology", careerPaths: ["Programmer"]),
        Option(text: "Art", careerPaths: ["Architect"]),
        Option(text: "Research", careerPaths: ["Scientist"])
    ], imageName: "star"),
    // Add more questions as needed
]
