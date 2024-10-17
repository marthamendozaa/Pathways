//
//  ProfileView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        VStack {
            
            if let user = userData.user {
                
                // Calculate total perfect matches across all quizzes
                let totalPerfectMatches = user.quizAnswers.reduce(0) { total, quizAnswers in
                    total + (quizAnswers.quizResult?.results.filter { $0.matchPercentage == 100 }.count ?? 0)
                }

                Text("Total perfect matches across all quizzes: \(totalPerfectMatches)")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                List(user.quizAnswers) { quizAnswers in
                    
                    if let quizResult = quizAnswers.quizResult {
                        VStack(alignment: .leading) {
                            Text("Quiz taken on \(quizResult.dateTaken, formatter: dateFormatter)")
                            
                            
                            
                            ForEach(quizResult.results) { match in
                                HStack {
                                    Text("\(match.career): \(match.matchPercentage)% match")
                                    if match.matchPercentage == 100 {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                            Divider()
                        }
                    }
                }
            } else {
                Text("No quizzes taken yet.")
            }
        }
        .navigationTitle("Profile")
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleQuizResults = [
            QuizAnswers(
                answers: [
                    Answer(questionId: 1, selectedOption: "Yes"),
                    Answer(questionId: 2, selectedOption: "No")
                ],
                quizResult: QuizResult(
                    dateTaken: Date(),
                    results: [
                        CareerMatch(career: "Accountant", matchPercentage: 50),
                        CareerMatch(career: "Artist", matchPercentage: 50)
                    ]
                )
            ),
            QuizAnswers(
                answers: [
                    Answer(questionId: 1, selectedOption: "No"),
                    Answer(questionId: 2, selectedOption: "Yes")
                ],
                quizResult: QuizResult(
                    dateTaken: Date().addingTimeInterval(-86400), // 1 day ago
                    results: [
                        CareerMatch(career: "Engineer", matchPercentage: 100),
                        CareerMatch(career: "Doctor", matchPercentage: 30)
                    ]
                )
            ),
            QuizAnswers(
                answers: [
                    Answer(questionId: 1, selectedOption: "Maybe"),
                    Answer(questionId: 2, selectedOption: "Maybe")
                ],
                quizResult: QuizResult(
                    dateTaken: Date().addingTimeInterval(-172800), // 2 days ago
                    results: [
                        CareerMatch(career: "Teacher", matchPercentage: 80),
                        CareerMatch(career: "Lawyer", matchPercentage: 100)
                    ]
                )
            )
        ]
        let userData = UserData()
        userData.user = User(quizAnswers: sampleQuizResults)
        
        return ProfileView()
            .environmentObject(userData)
    }
}
