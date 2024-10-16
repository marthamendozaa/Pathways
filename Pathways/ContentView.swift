//
//  ContentView.swift
//  Pathways
//
//  Created by Martha Mendoza Alfaro on 09/10/24.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var userData = UserData()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Career Quiz")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: QuizView().environmentObject(userData)) {
                    Text("Start Quiz")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)

                NavigationLink(destination: ResultsView().environmentObject(userData)) {
                    Text("View Results")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)

                NavigationLink(destination: ProfileView().environmentObject(userData)) {
                    Text("View Profile")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationTitle("Career Quiz")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: [Answer.self])
    }
}
