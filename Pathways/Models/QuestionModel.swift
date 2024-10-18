//
//  QuizData.swift
//  QuizApp
//
//  Created by Martha Mendoza Alfaro on 14/10/24.
//

import Foundation

// Each question
struct Question: Identifiable {
    let id = UUID()
    let order: Int
    let text: String
    let options: [Option]
    var imageName: String
}

// Each option of the question
struct Option: Identifiable {
    var id = UUID()
    let text: String
    let careerPaths: [String]
}

let questions: [Question] = [
    Question(order: 1, text: "What subjects did you excel in during school?", options: [
        Option(text: "Biology and Chemistry", careerPaths: ["Doctor", "Scientist", "Teacher", "Engineer"]),
        Option(text: "Mathematics and Physics", careerPaths: [ "Engineer","Teacher", "Economist", "Scientist"]),
        Option(text: "Art and Design", careerPaths: ["Architect", "Artist", "Teacher", "Historian"]),
        Option(text: "Computer Science", careerPaths: ["Programmer", "Engineer", "Teacher"])
    ], imageName: "books"),

    Question(order: 2, text: "What type of projects have you enjoyed working on the most?", options: [
        Option(text: "Healthcare initiatives", careerPaths: ["Doctor", "Teacher", "Scientist"]),
        Option(text: "Software development", careerPaths: ["Programmer", "Engineer"]),
        Option(text: "Creative design", careerPaths: ["Architect", "Artist", "Engineer"]),
        Option(text: "Scientific research", careerPaths: ["Scientist", "Doctor"])
    ], imageName: "lightbulb"),

    Question(order: 3, text: "Which activities did you participate in?", options: [
        Option(text: "Science club or lab work", careerPaths: ["Scientist", "Doctor", "Engineer", "Teacher"]),
        Option(text: "Programming or robotics team", careerPaths: ["Programmer", "Engineer", "Scientist"]),
        Option(text: "Art club or design projects", careerPaths: ["Artist", "Architect", "Historian"]),
        Option(text: "Debate team or writing club", careerPaths: ["Historian", "Lawyer", "Teacher"])
    ], imageName: "clipboard"),

    Question(order: 4, text: "What type of work environment do you prefer?", options: [
        Option(text: "In an office", careerPaths: ["Engineer", "Lawyer", "Economist", "Programmer", "Architect", "Scientist"]),
        Option(text: "On the field", careerPaths: ["Scientist", "Doctor", "Engineer"]),
        Option(text: "Creative studio", careerPaths: ["Artist", "Architect"]),
        Option(text: "Remote work", careerPaths: ["Programmer"])
    ], imageName: "office"),

    Question(order: 5, text: "How do you prefer to solve problems?", options: [
        Option(text: "Analyze data and facts", careerPaths: ["Scientist","Doctor", "Economist","Engineer", "Programmer"]),
        Option(text: "Use creativity", careerPaths: ["Artist", "Architect", "Teacher"]),
        Option(text: "Consult others", careerPaths: ["Teacher", "Lawyer"]),
        Option(text: "Apply logical reasoning", careerPaths: ["Lawyer", "Engineer", "Programmer", "Scientist"])
    ], imageName: "problem-solving"),

    Question(order: 6, text: "What subjects do you enjoy the most?", options: [
        Option(text: "Math and Science", careerPaths: ["Engineer", "Scientist", "Economist", "Doctor"]),
        Option(text: "Literature and History", careerPaths: ["Historian", "Teacher", "Lawyer"]),
        Option(text: "Art and Design", careerPaths: ["Architect", "Artist", "Teacher"]),
        Option(text: "Computer Science", careerPaths: ["Programmer", "Engineer"])
    ], imageName: "subjects"),

    Question(order: 7, text: "Do you prefer to work in teams or independently?", options: [
        Option(text: "In teams", careerPaths: ["Teacher", "Engineer","Doctor"]),
        Option(text: "Independently", careerPaths: ["Artist","Economist", "Lawyer", "Historian", "Programmer"]),
        Option(text: "A mix of both", careerPaths: ["Engineer","Doctor","Programmer", "Scientist", "Architect"])
    ], imageName: "teamwork"),

    Question(order: 8, text: "What motivates you the most?", options: [
        Option(text: "Making a difference", careerPaths: ["Doctor", "Teacher", "Scientist"]),
        Option(text: "Creating something new", careerPaths: ["Artist", "Architect", "Engineer"]),
        Option(text: "Solving complex problems", careerPaths: ["Engineer", "Scientist", "Economist", ]),
        Option(text: "Achieving financial success", careerPaths: ["Economist", "Programmer", "Lawyer"])
    ], imageName: "motivation"),

    Question(order: 9, text: "What kind of projects do you enjoy working on?", options: [
        Option(text: "Health-related projects", careerPaths: ["Doctor", "Scientist", "Teacher"]),
        Option(text: "Design/creating projects", careerPaths: ["Architect", "Artist", "Engineer"]),
        Option(text: "Software development", careerPaths: ["Programmer", "Engineer"]),
        Option(text: "Research projects and analysis", careerPaths: ["Scientist", "Economist", "Historian"])
    ], imageName: "projects"),

    Question(order: 10, text: "How do you feel about public speaking?", options: [
        Option(text: "I enjoy it", careerPaths: ["Teacher", "Lawyer", "Historian"]),
        Option(text: "I am neutral", careerPaths: ["Economist", "Scientist", "Engineer"]),
        Option(text: "I prefer not to", careerPaths: ["Programmer", "Artist", "Doctor", "Architect", "Scientist"])
    ], imageName: "public-speaking"),

    Question(order: 11, text: "What do you value most in a career?", options: [
        Option(text: "Job security", careerPaths: ["Doctor", "Engineer", "Scientist"]),
        Option(text: "Creative freedom", careerPaths: ["Artist", "Architect", "Teacher"]),
        Option(text: "Impact on society", careerPaths: ["Teacher", "Engineer", "Scientist"]),
        Option(text: "Financial rewards", careerPaths: ["Lawyer", "Economist", "Programmer"])
    ], imageName: "career-value"),

    Question(order: 12, text: "What kind of tasks do you enjoy the most?", options: [
        Option(text: "Hands-on tasks", careerPaths: ["Engineer", "Doctor", "Scientist"]),
        Option(text: "Creative tasks", careerPaths: ["Artist", "Architect", "Teacher"]),
        Option(text: "Analytical tasks", careerPaths: ["Scientist", "Economist", "Programmer"]),
        Option(text: "Teaching or guiding others", careerPaths: ["Teacher", "Lawyer"])
    ], imageName: "tasks"),

    Question(order: 13, text: "Which of the following describes your ideal job?", options: [
        Option(text: "Helping others directly", careerPaths: ["Doctor", "Teacher", "Scientist"]),
        Option(text: "Creating and innovating", careerPaths: ["Architect", "Engineer", "Programmer", "Artist"]),
        Option(text: "Researching and discovering", careerPaths: ["Scientist", "Engineer", "Historian"]),
        Option(text: "Leading and influencing", careerPaths: ["Lawyer", "Economist"])
    ], imageName: "ideal-job"),

    Question(order: 14, text: "What type of impact do you want to have on the world?", options: [
        Option(text: "Improve people's lives", careerPaths: ["Doctor", "Teacher", "Engineer", "Scientist"]),
        Option(text: "Develop new technologies", careerPaths: ["Programmer", "Scientist", "Engineer"]),
        Option(text: "Preserve culture and history", careerPaths: ["Historian", "Artist", "Teacher"]),
        Option(text: "Influence public policies", careerPaths: ["Lawyer", "Economist"])
    ], imageName: "impact"),

    Question(order: 15, text: "How do you prefer to tackle challenges?", options: [
        Option(text: "With a hands-on approach", careerPaths: ["Engineer", "Scientist", "Doctor"]),
        Option(text: "Thinking outside the box", careerPaths: ["Engineer", "Artist", "Architect", "Programmer"]),
        Option(text: "Collaborating with others", careerPaths: ["Teacher", "Doctor", "Lawyer", "Scientist"]),
        Option(text: "Analyzing information", careerPaths: ["Economist", "Lawyer", "Scientist", "Programmer"])
    ], imageName: "challenge"),

    Question(order: 16, text: "What is your preferred learning style?", options: [
        Option(text: "Learning by doing", careerPaths: ["Engineer", "Doctor", "Scientist"]),
        Option(text: "Visual and creative learning", careerPaths: ["Artist", "Architect", "Teacher"]),
        Option(text: "Reading and research", careerPaths: ["Historian", "Scientist", "Economist", "Doctor"]),
        Option(text: "Group discussions and interactions", careerPaths: ["Teacher", "Lawyer", "Economist"])
    ], imageName: "learning-style"),

    Question(order: 17, text: "How do you feel about working with technology?", options: [
        Option(text: "I love it and want to use it every day", careerPaths: ["Programmer", "Engineer", "Scientist"]),
        Option(text: "I like it, but prefer human interaction", careerPaths: ["Teacher", "Doctor", "Lawyer"]),
        Option(text: "I use it mainly for research", careerPaths: ["Economist", "Lawyer","Teacher", "Historian"])
    ], imageName: "technology"),

    Question(order: 18, text: "What motivates you to succeed?", options: [
        Option(text: "Helping others", careerPaths: ["Doctor", "Teacher", "Scientist"]),
        Option(text: "Achieving personal goals", careerPaths: ["Artist", "Programmer", "Engineer"]),
        Option(text: "Contributing to society", careerPaths: ["Historian", "Engineer", "Economist", "Lawyer"]),
        Option(text: "Gaining recognition and respect", careerPaths: ["Lawyer", "Economist","Teacher"])
    ], imageName: "motivation"),

    Question(order: 19, text: "What type of problem-solving do you enjoy?", options: [
        Option(text: "Health-related problem-solving", careerPaths: ["Doctor", "Scientist"]),
        Option(text: "Creative problem-solving", careerPaths: ["Artist", "Programmer", "Architect", "Engineer"]),
        Option(text: "Technical problem-solving", careerPaths: ["Engineer", "Economist", "Programmer"]),
        Option(text: "Social or political problem-solving", careerPaths: ["Lawyer", "Teacher", "Historian", "Economist"])
    ], imageName: "problem-solving"),

    Question(order: 20, text: "How do you handle stress in high-pressure situations?", options: [
        Option(text: "I stay calm and methodical", careerPaths: ["Doctor", "Engineer", "Scientist"]),
        Option(text: "I get creative to find solutions", careerPaths: ["Artist", "Architect", "Programmer"]),
        Option(text: "I prefer to talk it out with others", careerPaths: ["Teacher", "Lawyer"]),
        Option(text: "I rely on data and analysis", careerPaths: ["Economist", "Scientist", "Programmer"])
    ], imageName: "stress-management"),

    Question(order: 21, text: "What kind of work-life balance do you prefer?", options: [
        Option(text: "Work-focused, with less time for hobbies", careerPaths: ["Doctor", "Scientist", "Engineer"]),
        Option(text: "I need creative time outside work", careerPaths: ["Artist", "Architect", "Programmer"]),
        Option(text: "Work that fits into my lifestyle", careerPaths: ["Economist", "Lawyer"]),
        Option(text: "A well-structured routine", careerPaths: ["Engineer","Lawyer", "Historian", "Scientist"])
    ], imageName: "work-life"),

]




