//
//  ResultsView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI
import SwiftData


import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var userData: UserData
    
    

    var body: some View {
        VStack {
            if let user = userData.user {
                Text("Quiz Results")
                    .font(.largeTitle)
                    .padding()

                List(user.quizResults) { result in
                    VStack(alignment: .leading) {
                        ForEach(result.results) { match in
                            Text("\(match.career): \(match.matchPercentage)% match")
                        }
                    }
                    .padding()
                }
                
            }

        }
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
