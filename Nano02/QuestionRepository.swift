//
//  QuestionRepository.swift
//  Nano02
//
//  Created by Eduardo Stefanel Paludo on 02/08/23.
//

import Foundation

class QuestionRepository: ObservableObject {    
    @Published var currentQuestion: Question
    @Published var index: Int = 1
    @Published var empty: Bool = false
    private var questions: [Question] = [
        // Abs
        Question(image: "crunch", question: "What is the name of the exercise below?", options: [Option(name: "Crunch"), Option(name: "Reverse Crunch"), Option(name: "Pull Up"), Option(name: "Pull Down")].shuffled(), correctOption: "Crunch"),
        Question(image: "bent-knee-reverse-crunch", question: "What is another exercise that targets the same muscle group as the one below?", options: [Option(name: "V-Up"), Option(name: "Lying Leg Curl"), Option(name: "Hang Clean"), Option(name: "Snatch")].shuffled(), correctOption: "V-Up"),
        Question(image: "hanging-leg-raise", question: "What is the type of grip being executed in the exercise below?", options: [Option(name: "Pronated"), Option(name: "Supinated"), Option(name: "Alterned"), Option(name: "Hook")].shuffled(), correctOption: "Pronated"),
        Question(image: "plank", question: "What is the main muscle of the core targeted by this exercise?", options: [Option(name: "Rectus Abdominis"), Option(name: "External Obliques"), Option(name: "Internal Obliques"), Option(name: "Hip Flexors")].shuffled(), correctOption: "Rectus Abdominis"),
        
        // Back
        Question(image: "close-grip-pulldown", question: "What is the name of this exercise?", options: [Option(name: "Close-Grip Pulldown"), Option(name: "Close-Grip Pull Up"), Option(name: "Close-Grip Push-Up"), Option(name: "Peck Deck")].shuffled(), correctOption: "Close-Grip Pulldown"),
        Question(image: "dumbbell-bent-over-row", question: "What is the main muscle group targeted by this exercise?", options: [Option(name: "Back"), Option(name: "Biceps"), Option(name: "Triceps"), Option(name: "Chest")].shuffled(), correctOption: "Back"),
        Question(image: "seated-cable-row", question: "Which of the options is the best to replace the exercise below?", options: [Option(name: "T-Bar Row"), Option(name: "Leg Press"), Option(name: "Power Jerk"), Option(name: "Deadlift")].shuffled(), correctOption: "T-Bar Row"),
        Question(image: "tbar-row", question: "Which of these muscles is not actively being worked in the exercise below?", options: [Option(name: "Triceps"), Option(name: "Lats"), Option(name: "Trapezius"), Option(name: "Rear Deltoids")].shuffled(), correctOption: "Triceps"),
        Question(image: "wide-grip-pulldown", question: "What is the main muscle being worked in this exercise?", options: [Option(name: "Lats"), Option(name: "Biceps"), Option(name: "Chest"), Option(name: "Forearm Flexors")].shuffled(), correctOption: "Lats"),
        
        // Biceps
        Question(image: "alternating-dumbbell-curl", question: "What is the name of the exercise below?", options: [Option(name: "Alternating Dumbbell Curl"), Option(name: "Alternating Barbell Curl"), Option(name: "Concentration Curl"), Option(name: "Spider Curl")].shuffled(), correctOption: "Alternating Dumbbell Curl"),
        Question(image: "barbell-curl", question: "What is another exercise that targets the same muscle as the one below?", options: [Option(name: "Cable Curl With Bar"), Option(name: "Bench Dip"), Option(name: "Barbell Front Raise"), Option(name: "Dumbbell Pullover")].shuffled(), correctOption: "Cable Curl With Bar"),
        Question(image: "rope-cable-curl", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Biceps"), Option(name: "Triceps"), Option(name: "Forearm Flexors"), Option(name: "Front Deltoid")].shuffled(), correctOption: "Biceps"),
     
        // Calves
        Question(image: "seated-calf-raise", question: "What calf muscle is the most requested in this exercise?", options: [Option(name: "Inner"), Option(name: "Outer"), Option(name: "Quads"), Option(name: "Glutes")].shuffled(), correctOption: "Inner"),
        Question(image: "standing-calf-raise", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Calves"), Option(name: "Quads"), Option(name: "Glutes"), Option(name: "Adductors")].shuffled(), correctOption: "Calves"),
        
        // Chest
        Question(image: "barbell-bench-press", question: "What is the name of the exercise below?", options: [Option(name: "Barbell Bench Press"), Option(name: "Peck Deck"), Option(name: "Dumbbell Chest Press"), Option(name: "Bench Dip")].shuffled(), correctOption: "Barbell Bench Press"),
        Question(image: "cable-crossover", question: "What is the main muscle group targeted by this exercise?", options: [Option(name: "Chest"), Option(name: "Triceps"), Option(name: "Back"), Option(name: "Legs")].shuffled(), correctOption: "Chest"),
        Question(image: "incline-dumbbell-bench-press", question: "What part of the chest does this exercise focus on?", options: [Option(name: "Upper"), Option(name: "Middle"), Option(name: "Lower"), Option(name: "None of the alternatives")].shuffled(), correctOption: "Upper"),
        Question(image: "incline-dumbbell-bench-press", question: "What is the main muscle group targeted by this exercise?", options: [Option(name: "Chest"), Option(name: "Biceps"), Option(name: "Triceps"), Option(name: "Shoulder")].shuffled(), correctOption: "Chest"),
        
        // Legs
        Question(image: "barbbell-romanian-deadlift", question: "What muscle isn't actively requested in the exercise below?", options: [Option(name: "Calves"), Option(name: "Glutes"), Option(name: "Lower Back"), Option(name: "Hamstrings")].shuffled(), correctOption: "Calves"),
        Question(image: "front-squat", question: "What kind of squat is the one shown below?", options: [Option(name: "Front Squat"), Option(name: "Air Squat"), Option(name: "Bulgarian Split Squat"), Option(name: "Sumo Squat")].shuffled(), correctOption: "Front Squat"),
        Question(image: "lunges", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Quads"), Option(name: "Hamstrings"), Option(name: "Calves"), Option(name: "Biceps")].shuffled(), correctOption: "Quads"),
        Question(image: "barbell-hip-thrust", question: "Which of the options is the best to replace the exercise below?", options: [Option(name: "Standing Cable Kickback"), Option(name: "Squat"), Option(name: "Bench Dips"), Option(name: "Pull-Up")].shuffled(), correctOption: "Standing Cable Kickback"),
        Question(image: "burpees", question: "What is the name of this exercise?", options: [Option(name: "Burpee"), Option(name: "Squat"), Option(name: "Bird Dog"), Option(name: "Lunge")].shuffled(), correctOption: "Burpee"),
        Question(image: "hack-squat", question: "What is the name of this exercise?", options: [Option(name: "Hack Squat Machine"), Option(name: "Hip Adduction Machine"), Option(name: "Smith Machine Squat"), Option(name: "Romanian Deadlift")].shuffled(), correctOption: "Hack Squat Machine"),
        
        // Shoulder
        Question(image: "dumbbell-front-raise", question: "What muscle group does this exercise focus on?", options: [Option(name: "Shoulder"), Option(name: "Biceps"), Option(name: "Chest"), Option(name: "Back")].shuffled(), correctOption: "Shoulder"),
        Question(image: "dumbbell-lateral-raise", question: "What is the name of the exercise below?", options: [Option(name: "Dumbbell Lateral Raise"), Option(name: "Dumbbell Front Raise"), Option(name: "Power Jerk"), Option(name: "Barbell Curl")].shuffled(), correctOption: "Dumbbell Lateral Raise"),
        Question(image: "high-cable-rear-delt-fly", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Rear Deltoid"), Option(name: "Quads"), Option(name: "Biceps"), Option(name: "Serratus")].shuffled(), correctOption: "Rear Deltoid"),
        Question(image: "dumbbell-shoulder-press", question: "What is the name of the exercise below?", options: [Option(name: "Shoulder Press"), Option(name: "Bench Press"), Option(name: "Peck Deck"), Option(name: "Chin-Up")].shuffled(), correctOption: "Shoulder Press"),
        
        // Triceps
        Question(image: "bench-dips", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Chest"), Option(name: "Triceps"), Option(name: "Back"), Option(name: "Calves")].shuffled(), correctOption: "Triceps"),
        Question(image: "close-grip-bench-press", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Triceps"), Option(name: "Biceps"), Option(name: "Chest"), Option(name: "Forearm Flexors")].shuffled(), correctOption: "Triceps"),
        Question(image: "triceps-pressdown", question: "What is the name of the exercise below?", options: [Option(name: "Triceps Pressdown"), Option(name: "Triceps Push-Up"), Option(name: "Biceps Pressdown"), Option(name: "Biceps Pull-Up")].shuffled(), correctOption: "Triceps Pressdown")
    ]
    
    init() {
        questions.shuffle()
        currentQuestion = questions.first!
        questions.remove(at: 0)
    }
    
    func getNextQuestion() {
        if let question = questions.first {
            currentQuestion = question
            index += 1
            questions.remove(at: 0)
            if index == 11 {
                empty = true
            }
        } else {
            empty = true
        }
    }
}
