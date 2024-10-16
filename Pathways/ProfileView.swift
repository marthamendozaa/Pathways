//
//  ProfileView.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData

    
    var body: some View {
        VStack {
            if let user = userData.user {
                Text("Profile")
                    .font(.title)
                    .padding()
                
                List(user.quizResults) { result in
                    VStack(alignment: .leading) {
                        Text("Quiz taken on \(result.dateTaken, formatter: dateFormatter)")
                        ForEach(result.results) { match in
                            Text("\(match.career): \(match.matchPercentage)% match")
                        }
                        Divider()
                    }
                }
            } else {
                Text("No user data available")
                    .font(.title)
                    .padding()
            }
        }
        .navigationTitle("Profile")
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    return formatter
}()
