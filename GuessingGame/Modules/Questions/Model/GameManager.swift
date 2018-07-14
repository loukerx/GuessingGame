//
//  GameManager.swift
//  GuessingGame
//
//  Created by Yin Hua on 14/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import Foundation

struct GameManager {
    var currentIndex = 0
    var currentPoint = 0
    var pointMessage: String {
        return "Your point is: \(currentPoint)"
    }
}
