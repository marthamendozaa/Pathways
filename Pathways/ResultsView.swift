//
//  ResultsView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI
import SwiftData

struct ResultsView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var userData: UserData
    
    

    var body: some View {
            VStack {
                if let user = userData.user, let latestQuizResult = user.quizAnswers.last?.quizResult {
                    VStack(alignment: .leading) {
                        Text("Latest Quiz Result")
                            .font(.title)
                            .padding()
                        ForEach(latestQuizResult.results) { match in
                            Text("\(match.career): \(match.matchPercentage)% match")
                        }
                        .padding(.top, 5)
                    }
                } else {
                    Text("No results available.")
                }
            }
            .padding()
            .navigationTitle("Results")
    }
}

/*
struct ResultsView: View {
    @EnvironmentObject var userData: UserData
    

    var body: some View {
        VStack {
            Text("Quiz Results")
                .font(.largeTitle)
                .padding()

            let results = userData.calculateCareerMatches()

            if results.isEmpty {
                Text("No results available.")
                    .padding()
            } else {
                // Convert results dictionary to an array of tuples for the List
                List(Array(results.sorted(by: { $0.value > $1.value })) , id: \.key) { careerMatch in
                    VStack(alignment: .leading) {
                        Text("\(careerMatch.key): \(careerMatch.value)%")
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Results")
    }
}

*/
