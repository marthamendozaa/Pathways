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

    let customPurple = Color(red: 95/255, green: 85/255, blue: 216/255)

    var body: some View {
        VStack {
            if let user = userData.user {
                // Calculate total perfect matches across all quizzes
                let totalPerfectMatches = user.quizAnswers.reduce(0) { total, quizAnswers in
                    total + (quizAnswers.quizResult?.results.filter { $0.matchPercentage == 100 }.count ?? 0)
                }

                // Determine the highest match percentage across all quizzes
                let highestMatchPercentage = user.quizAnswers.flatMap { $0.quizResult?.results.map { $0.matchPercentage } ?? [] }.max() ?? 0

                // Show the corresponding image based on the highest match percentage
                MatchImageView(highestMatchPercentage: highestMatchPercentage)
                    .padding(.bottom, 10)

                HStack {
                    Text("Total perfect matches across all quizzes: ")
                        .font(.largeTitle.weight(.bold))
                        .multilineTextAlignment(.center)
                    
                        
                    
                }
                Spacer()
                AnimatedColorTextView(textName: String(totalPerfectMatches))
                    .frame(width: 40.0, height: 50.0)
                    //font(.system(.size(30)))
                    .font(.system(size: 60).weight(.bold))
                    //.font(.extraLargeTitle2.weight(.bold))

                List(user.quizAnswers) { quizAnswers in
                    if let quizResult = quizAnswers.quizResult {
                        VStack(alignment: .leading) {
                            Text("Quiz taken on \(quizResult.dateTaken, formatter: dateFormatter)")
                                .font(.title3.weight(.bold))
                                .foregroundColor(.white)
                                .padding(.bottom, 3)

                            // Use prefix(4) to limit to the first 4 matches
                            ForEach(quizResult.results.prefix(4)) { match in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "sparkle")
                                            .foregroundColor(.white)
                                            .font(.system(size: 10).weight(.bold))
                                            
                                        
                                        Text("\(match.career): \(match.matchPercentage)% match")
                                            .foregroundColor(.white)
                                            .font(.subheadline.weight(.bold))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                            .fixedSize(horizontal: false, vertical: true)

                                        if match.matchPercentage == 100 {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                    }

                                }
                                //.padding(10)
                                
                            }
                            
                            Divider()
                        }
                        .padding(10)
                        .background(customPurple)
                        .mask(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                        )

                        .padding(.top, 5)
                    }
                }
                .listStyle(PlainListStyle())
            } else {
                Text("No quizzes taken yet.")
            }
        }
        .navigationTitle("Your Results")
        .padding()
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
