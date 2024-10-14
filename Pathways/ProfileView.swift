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
    var user: User?

    var body: some View {
        VStack {
            if let user = user {
                Text("Profile: \(user.name)")
                    .font(.largeTitle)
                    .padding()

                Text("Quiz Results:")
                    .font(.headline)
                    .padding()

                List(user.quizResults, id: \.id) { result in
                    VStack(alignment: .leading) {
                        Text("Date Taken: \(formattedDate(result.dateTaken))")
                            .font(.subheadline)

                        ForEach(result.results, id: \.career) { match in
                            Text("\(match.career): \(match.matchPercentage)%")
                        }
                    }
                    .padding()
                }
            } else {
                Text("No user data available.")
            }
        }
        .navigationTitle("Profile")
        .padding()
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
