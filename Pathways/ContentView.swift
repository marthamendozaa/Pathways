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
    
    @State private var colorChange = false
    @State private var isRotating = false
    @State private var isScaling = false
    
    let customPurple = Color(red: 95/255, green: 85/255, blue: 216/255)
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                customPurple
                    .ignoresSafeArea()

                VStack {
                    
                    VStack {
                        
                        Text("Pathways")
                            .font(.system(size: 54, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.top, 20) // Regola questo valore per cambiare altezza
                    }
                    
                    
                    Spacer().frame(height: 1) // Spazio iniziale per separare il logo
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit() // Mantiene le proporzioni originali
                        .frame(width: 230, height: 230) // Imposta le dimensioni desiderate
                        .padding(60)

                    Spacer().frame(height: 1) // Controllo ulteriore della spaziatura sotto il logo
                    
                    NavigationLink(destination: QuizView().environmentObject(userData)) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Start Quiz")
                                .font(.largeTitle.weight(.bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                AnimatedColorImageView(imageName: "sparkle.magnifyingglass")
                                
                                AnimatedImageView(imageName: "sparkle", customColor: customPurple)
                                
                                Text("Learn what your most probable paths are".uppercased())
                                    .font(.footnote.weight(.semibold))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                        .padding(18)
                        .background(.white)
                        .mask(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                        )
                        .foregroundStyle(customPurple)
                        .padding(20)
                    }

                    NavigationLink(destination: ProfileView().environmentObject(userData)) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("View Results")
                                .font(.largeTitle.weight(.bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                Image(systemName: "wand.and.stars")
                                    .font(.title)
                                Text("Check your different results from each of your quizzes".uppercased())
                                    .font(.footnote.weight(.semibold))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                        .padding(20)
                        .background(.white)
                        .mask(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                        )
                        .foregroundStyle(customPurple)
                        .padding(20)
                    }
                    
                    Spacer() // Questo gestisce lo spazio rimanente in basso
                    
                }
                
               
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: [Answer.self])
    }
}
