//
//  Service.swift
//  GuessingGame
//
//  Created by Yin Hua on 14/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()

    func fetchData(completion: @escaping (Game?, Error?) -> ()) {
        let jsonPath = Bundle.main.path(forResource: "game", ofType: "json")
        let url = URL(fileURLWithPath: jsonPath!)
        do{
            let data = try Data(contentsOf: url)
            let game = try JSONDecoder().decode(Game.self, from: data)
            completion(game, nil)
        } catch let error as Error? {
            completion(nil, error)
        }
    }
}
