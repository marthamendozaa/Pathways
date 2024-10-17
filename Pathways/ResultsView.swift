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
    
    let customPurple = Color(red: 95/255, green: 85/255, blue: 216/255)

    var body: some View {
        ZStack {
            customPurple
                .ignoresSafeArea()
            VStack {
                if let user = userData.user, let latestQuizResult = user.quizAnswers.last?.quizResult {
                    VStack(alignment: .leading) {
                        Text("Your Quiz Result:")
                            .font(.largeTitle.weight(.bold))
                            .padding(20)
                            .foregroundColor(.white)
                        
                        ForEach(latestQuizResult.results) { match in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(match.career): \(match.matchPercentage)% match")
                                        .foregroundColor(.white)
                                    if match.matchPercentage == 100 {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                                
                                // Add messages based on match percentages
                                if match.matchPercentage >= 70 && match.matchPercentage < 100 {
                                    Text("You are so close to knowing your 100% path!")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                } else if match.matchPercentage >= 50 && match.matchPercentage < 70 {
                                    Text("You have an idea, but you may want to think about it more.")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.top, 5)
                        }
                        
                    }
                } else {
                    Text("No results available.")
                }
            }
            //.customNavigationBarAppearance()
            .navigationTitle("Results")
            .padding()
        }
        //.customNavigationBarAppearance()
    }
}

// Preview
struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        // Creating mock data for preview
        let mockCareerMatches = [
            CareerMatch(career: "Engineer", matchPercentage: 100),
            CareerMatch(career: "Doctor", matchPercentage: 76),
            CareerMatch(career: "Artist", matchPercentage: 65)
        ]
        let mockQuizResult = QuizResult(dateTaken: Date(), results: mockCareerMatches)
        let mockQuizAnswer = QuizAnswers(answers: [], quizResult: mockQuizResult)
        let mockUser = User(quizAnswers: [mockQuizAnswer])

        let userData = UserData()
        userData.user = mockUser
        //userData.perfectMatchCareers = ["Doctor"] //example of perfect match

        return ResultsView()
            .environmentObject(userData)
    }
}
