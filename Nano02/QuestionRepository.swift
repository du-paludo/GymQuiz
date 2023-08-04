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
        Question(image: "bench-dips", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Chest"), Option(name: "Triceps"), Option(name: "Back"), Option(name: "Calves")], correctOption: "Triceps"), 
        Question(image: "cable-crossover", question: "What is the main muscle targeted by this exercise?", options: [Option(name: "Chest"), Option(name: "Triceps"), Option(name: "Back"), Option(name: "Legs")], correctOption: "Chest")
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
        } else {
            empty = true
        }
    }
}
