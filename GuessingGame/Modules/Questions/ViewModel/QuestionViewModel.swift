//
//  QuestionViewModel.swift
//  GuessingGame
//
//  Created by Yin Hua on 14/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import Foundation

struct QuestionViewModel {
    let correctAnswerIndex: Int
    let imageUrl: URL
    let standFirst: String
    let storyUrl: URL
    let section: String
    let firstAnswer: String
    let secondAnswer: String
    let thirdAnswer: String
    
    init(question: Question) {
        self.correctAnswerIndex = question.correctAnswerIndex
        self.imageUrl = question.imageUrl
        self.standFirst = question.standFirst
        self.storyUrl = question.storyUrl
        self.section = question.section
        self.firstAnswer = question.headlines[0]
        self.secondAnswer = question.headlines[1]
        self.thirdAnswer = question.headlines[2]
    }
}
