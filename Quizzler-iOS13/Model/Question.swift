//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by khalil.panahi on 12/10/21.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: String

init(q: String, a: [String], ca: String) {
        question = q
        answers = a
        correctAnswer = ca
        
    }
}
