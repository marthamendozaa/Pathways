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
            VStack {
                if let user = userData.user, let latestQuizResult = user.quizAnswers.last?.quizResult {
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        HStack {
                            AnimatedImageView(imageName: "sparkle", customColor: customPurple)
                            Text("Your Quiz Result:")
                                .font(.largeTitle.weight(.bold))
                                .foregroundColor(.black)
                            AnimatedImageView(imageName: "sparkle", customColor: customPurple)
                        }
                        
                        // Determine the highest match percentage
                        let highestMatchPercentage = latestQuizResult.results.map { $0.matchPercentage }.max() ?? 0

                        // Show the corresponding image based on the highest match percentage
                        MatchImageView(highestMatchPercentage: highestMatchPercentage)

                        // Use prefix(5) to limit to the first 5 matches
                        ForEach(latestQuizResult.results.prefix(4)) { match in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(match.career): \(match.matchPercentage)% match")
                                        .foregroundColor(.white)
                                        .font(.title3.weight(.bold))
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    if match.matchPercentage >= 80 {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
 
                                    }
                                }
                                
                                // Use MatchMessageView to show the message
                                MatchMessageView(matchPercentage: match.matchPercentage)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(20)
                            .background(customPurple)
                            .mask(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                            )
                            .foregroundStyle(customPurple)
                            .padding(.horizontal, 20)
                            .padding(.top, 5)
                            .foregroundStyle(.black)
                            .padding(.top, 1)
                        }
                    }
                    
                    Spacer()
                    
                } else {
                    Text("No results available.")
                }
            }
            .navigationTitle("Results")
            .padding()
        }
    }
}

struct MatchImageView: View {
    let highestMatchPercentage: Int

    var body: some View {
        HStack {
            Spacer()
            if highestMatchPercentage >= 80 {
                Image("cat") // Assuming "cat" is the name of the image asset
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    
            } else if highestMatchPercentage >= 50 {
                Image("crow") // Assuming "crow" is the name of the image asset
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
            } else {
                Image("ant") // Assuming "ant" is the name of the image asset
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
            }
            Spacer()
        }
    }
}

struct MatchMessageView: View {
    let matchPercentage: Int

    var body: some View {
        VStack(alignment: .leading) {
            if matchPercentage == 100 {
                Text("Congratulations!🥳 You have a clear idea of your path!")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            } else if matchPercentage >= 50 && matchPercentage < 80 {
                Text("This may be your path! Want to explore it further? ✨")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            } else if matchPercentage < 50 && matchPercentage >= 30 {
                Text("There's an interest in this path, you may want to explore it more. ⚡️")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            } else {
                Text("There's something here, do you want to explore?")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top, 5) // Add some space above the message
    }
}

// Preview
struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        // Creating mock data for preview
        let mockCareerMatches = [
            CareerMatch(career: "Engineer", matchPercentage: 100),
            CareerMatch(career: "Doctor", matchPercentage: 36),
            CareerMatch(career: "Artist", matchPercentage: 65),
            CareerMatch(career: "Architect", matchPercentage: 40),
            CareerMatch(career: "Scientist", matchPercentage: 55),
            CareerMatch(career: "Nurse", matchPercentage: 80) // More than 5 to show the limit
        ]
        let mockQuizResult = QuizResult(dateTaken: Date(), results: mockCareerMatches)
        let mockQuizAnswer = QuizAnswers(answers: [], quizResult: mockQuizResult)
        let mockUser = User(quizAnswers: [mockQuizAnswer])

        let userData = UserData()
        userData.user = mockUser

        return ResultsView()
            .environmentObject(userData)
    }
}
