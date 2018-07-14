//
//  Game.swift
//  Game
//
//  Created by Yin Hua on 14/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import Foundation

struct Game: Decodable {
    let product: String
    let resultSize: Int
    let version: Int
    let questions: [Question]

    enum CodingKeys: String, CodingKey {
        case product
        case resultSize
        case version
        case questions = "items"
    }
}


struct Question: Decodable {
    let correctAnswerIndex: Int
    let imageUrl: URL
    let standFirst: String
    let storyUrl: URL
    let section: String
    let headlines: [String] 
}
