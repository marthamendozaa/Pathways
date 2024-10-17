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
    Question(order: 1, text: "What do you enjoy doing the most?", options: [
        Option(text: "Helping people", careerPaths: ["Doctor", "Scientist"]),
        Option(text: "Designing buildings", careerPaths: ["Architect"]),
        Option(text: "Writing code", careerPaths: ["Programmer"]),
        Option(text: "Doing experiments", careerPaths: ["Scientist"])
    ], imageName: "paintbrush"),
    Question(order: 2, text: "What are you most passionate about?", options: [
        Option(text: "Medicine", careerPaths: ["Doctor"]),
        Option(text: "Technology", careerPaths: ["Programmer"]),
        Option(text: "Art", careerPaths: ["Architect"]),
        Option(text: "Research", careerPaths: ["Scientist"])
    ], imageName: "star"),
    Question(order: 3, text: "Which kind of high school did you went to?", options: [
        Option(text: "Scientific", careerPaths: ["Doctor", "Scientist", "Programmer","Architect"]),
        Option(text: "Humanistic", careerPaths: ["Historian", "Teacher"]),
        Option(text: "Art and History", careerPaths: ["Architect"]),
        Option(text: "Linguistic", careerPaths: ["Scientist"])
    ], imageName: "C"),
   
        Question(order: 4, text: "What type of work environment do you prefer?", options: [
            Option(text: "In an office", careerPaths: ["Engineer", "Lawyer", "Economist"]),
            Option(text: "In the field", careerPaths: ["Scientist", "Engineer", "Doctor"]),
            Option(text: "Creative studio", careerPaths: ["Artist", "Architect"]),
            Option(text: "Remote work", careerPaths: ["Programmer", "Writer"])
        ], imageName: "office"),

        Question(order: 5, text: "How do you prefer to solve problems?", options: [
            Option(text: "Analyze data and facts", careerPaths: ["Scientist", "Economist"]),
            Option(text: "Use creativity", careerPaths: ["Artist", "Architect"]),
            Option(text: "Consult others", careerPaths: ["Doctor", "Teacher"]),
            Option(text: "Apply logical reasoning", careerPaths: ["Lawyer", "Engineer"])
        ], imageName: "problem-solving"),

        Question(order: 6, text: "What subjects do you enjoy the most?", options: [
            Option(text: "Math and Science", careerPaths: ["Engineer", "Scientist"]),
            Option(text: "Literature and History", careerPaths: ["Historian", "Teacher"]),
            Option(text: "Art and Design", careerPaths: ["Architect", "Artist"]),
            Option(text: "Computer Science", careerPaths: ["Programmer"])
        ], imageName: "subjects"),

        Question(order: 7, text: "Do you prefer to work in teams or independently?", options: [
            Option(text: "In teams", careerPaths: ["Doctor", "Teacher", "Programmer"]),
            Option(text: "Independently", careerPaths: ["Artist", "Scientist"]),
            Option(text: "A mix of both", careerPaths: ["Engineer", "Economist"])
        ], imageName: "teamwork"),

        Question(order: 8, text: "What motivates you the most?", options: [
            Option(text: "Making a difference", careerPaths: ["Doctor", "Teacher"]),
            Option(text: "Creating something new", careerPaths: ["Artist", "Architect"]),
            Option(text: "Solving complex problems", careerPaths: ["Engineer", "Scientist"]),
            Option(text: "Achieving financial success", careerPaths: ["Economist", "Lawyer"])
        ], imageName: "motivation"),

        Question(order: 9, text: "What kind of projects do you enjoy working on?", options: [
            Option(text: "Health-related projects", careerPaths: ["Doctor", "Scientist"]),
            Option(text: "Design projects", careerPaths: ["Architect"]),
            Option(text: "Software development", careerPaths: ["Programmer"]),
            Option(text: "Research projects", careerPaths: ["Scientist", "Economist"])
        ], imageName: "projects"),

        Question(order: 10, text: "How do you feel about public speaking?", options: [
            Option(text: "I enjoy it", careerPaths: ["Teacher", "Lawyer"]),
            Option(text: "I am neutral", careerPaths: ["Economist", "Scientist"]),
            Option(text: "I prefer not to", careerPaths: ["Programmer", "Artist"])
        ], imageName: "public-speaking"),

        Question(order: 11, text: "What do you value most in a career?", options: [
            Option(text: "Job security", careerPaths: ["Doctor", "Engineer"]),
            Option(text: "Creative freedom", careerPaths: ["Artist", "Architect"]),
            Option(text: "Impact on society", careerPaths: ["Teacher", "Scientist"]),
            Option(text: "Financial rewards", careerPaths: ["Lawyer", "Economist"])
        ], imageName: "career-value"),

        Question(order: 12, text: "What kind of tasks do you enjoy the most?", options: [
            Option(text: "Hands-on tasks", careerPaths: ["Engineer", "Doctor"]),
            Option(text: "Creative tasks", careerPaths: ["Artist", "Architect"]),
            Option(text: "Analytical tasks", careerPaths: ["Scientist", "Economist"]),
            Option(text: "Teaching or guiding others", careerPaths: ["Teacher"])
        ], imageName: "tasks"),

        Question(order: 13, text: "Which of the following describes your ideal job?", options: [
            Option(text: "Helping others directly", careerPaths: ["Doctor", "Teacher"]),
            Option(text: "Creating and innovating", careerPaths: ["Architect", "Programmer"]),
            Option(text: "Researching and discovering", careerPaths: ["Scientist", "Economist"]),
            Option(text: "Leading and influencing", careerPaths: ["Lawyer", "Engineer"])
        ], imageName: "ideal-job"),
    
        Question(order: 14, text: "What type of impact do you want to have on the world?", options: [
            Option(text: "Improve people's lives", careerPaths: ["Doctor", "Teacher"]),
            Option(text: "Develop new technologies", careerPaths: ["Programmer", "Engineer"]),
            Option(text: "Preserve culture and history", careerPaths: ["Historian", "Artist"]),
            Option(text: "Influence public policies", careerPaths: ["Lawyer", "Economist"])
        ], imageName: "impact"),

        Question(order: 15, text: "How do you prefer to tackle challenges?", options: [
            Option(text: "With a hands-on approach", careerPaths: ["Engineer", "Scientist"]),
            Option(text: "Thinking outside the box", careerPaths: ["Artist", "Architect"]),
            Option(text: "Collaborating with others", careerPaths: ["Teacher", "Doctor"]),
            Option(text: "Analyzing information", careerPaths: ["Economist", "Lawyer"])
        ], imageName: "challenge"),

        Question(order: 16, text: "What is your preferred learning style?", options: [
            Option(text: "Learning by doing", careerPaths: ["Engineer", "Doctor"]),
            Option(text: "Visual and creative learning", careerPaths: ["Artist", "Architect"]),
            Option(text: "Reading and research", careerPaths: ["Historian", "Scientist"]),
            Option(text: "Group discussions and interactions", careerPaths: ["Teacher", "Lawyer"])
        ], imageName: "learning-style"),

        Question(order: 17, text: "How do you feel about working with technology?", options: [
            Option(text: "I love it and want to use it every day", careerPaths: ["Programmer", "Engineer"]),
            Option(text: "I prefer technology that supports creativity", careerPaths: ["Artist", "Designer"]),
            Option(text: "I like it, but prefer human interaction", careerPaths: ["Teacher", "Doctor"]),
            Option(text: "I use it mainly for research", careerPaths: ["Scientist", "Economist"])
        ], imageName: "technology"),

        Question(order: 18, text: "What motivates you to succeed?", options: [
            Option(text: "Helping others", careerPaths: ["Doctor", "Teacher"]),
            Option(text: "Achieving personal goals", careerPaths: ["Artist", "Programmer"]),
            Option(text: "Contributing to society", careerPaths: ["Historian", "Economist"]),
            Option(text: "Gaining recognition and respect", careerPaths: ["Lawyer", "Engineer"])
        ], imageName: "motivation"),

        Question(order: 19, text: "What kind of activities do you enjoy in your free time?", options: [
            Option(text: "Volunteering or community service", careerPaths: ["Doctor", "Teacher"]),
            Option(text: "Creative hobbies like painting or designing", careerPaths: ["Artist", "Architect"]),
            Option(text: "Playing video games or coding", careerPaths: ["Programmer"]),
            Option(text: "Reading books or researching topics", careerPaths: ["Historian", "Scientist"])
        ], imageName: "hobbies"),

        Question(order: 20, text: "Which of the following best describes your ideal work-life balance?", options: [
            Option(text: "Flexible hours and remote work", careerPaths: ["Programmer", "Writer"]),
            Option(text: "Structured hours with clear boundaries", careerPaths: ["Lawyer", "Teacher"]),
            Option(text: "A mix of both, depending on the project", careerPaths: ["Engineer", "Artist"]),
            Option(text: "I don't mind long hours if I love my work", careerPaths: ["Doctor", "Scientist"])
        ], imageName: "work-life-balance"),

        Question(order: 21, text: "How important is job stability to you?", options: [
            Option(text: "Very important; I want a secure job", careerPaths: ["Doctor", "Engineer"]),
            Option(text: "Somewhat important; I prefer flexibility", careerPaths: ["Programmer", "Artist"]),
            Option(text: "Not important; I value creativity and passion", careerPaths: ["Historian", "Teacher"])
        ], imageName: "job-stability"),

        Question(order: 22, text: "What role do you see yourself playing in a team?", options: [
            Option(text: "The leader who guides others", careerPaths: ["Manager", "Lawyer"]),
            Option(text: "The creative thinker generating ideas", careerPaths: ["Artist", "Architect"]),
            Option(text: "The researcher providing information", careerPaths: ["Scientist", "Economist"]),
            Option(text: "The supportive team member", careerPaths: ["Teacher", "Doctor"])
        ], imageName: "team-role"),

        Question(order: 23, text: "What is your approach to learning new skills?", options: [
            Option(text: "I prefer structured classes and workshops", careerPaths: ["Engineer", "Scientist"]),
            Option(text: "I learn best through hands-on experience", careerPaths: ["Artist", "Programmer"]),
            Option(text: "I enjoy self-study and online courses", careerPaths: ["Economist", "Historian"]),
            Option(text: "I like group study sessions and discussions", careerPaths: ["Teacher", "Doctor"])
        ], imageName: "learning-skills")

    ]

