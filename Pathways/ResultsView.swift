//
//  ResultsView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI
import SwiftData

struct ResultsView: View {
    let answers: [Answer]

    var body: some View {
        let careerMatches = calculateCareerMatches(answers: answers)
        VStack {
            Text("Your Career Matches:")
                .font(.title)
            ForEach(careerMatches.sorted(by: { $0.value > $1.value }), id: \.key) { career, match in
                Text("\(career): \(match)%")
                    .font(.headline)
            }
        }
        .padding()
    }

    private func calculateCareerMatches(answers: [Answer]) -> [String: Int] {
        var careerCounts: [String: Int] = [:]
        let totalAnswers = answers.count

        for answer in answers {
            if let question = questions.first(where: { $0.id == answer.questionId }),
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

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(answers: [])
    }
}
