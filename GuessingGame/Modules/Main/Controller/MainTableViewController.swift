//
//  MainTableViewController.swift
//  GuessingGame
//
//  Created by Yin Hua on 14/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    @IBOutlet weak var gameNameLabel: UILabel!
    
    // MARK: - Property
    private var questionViewModels = [QuestionViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    private func fetchData() {
        Service.shared.fetchData { (game, error) in
            if let error = error {
                print("Failed to fetch game:", error)
                return
            }
            self.gameNameLabel.text = game?.product
            self.questionViewModels = game?.questions.map { QuestionViewModel(question: $0) } ?? []
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "start",
            let viewController = segue.destination as? QuestionViewController
        {
            viewController.questionViewModels = self.questionViewModels
        }
    }
 

}
