//
//  QuestionViewController.swift
//  GuessingGame
//
//  Created by Yin Hua on 10/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    // MARK: - Private
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var pointLabel: UILabel!
    @IBOutlet private weak var questionImageView: UIImageView!
    @IBOutlet private weak var firstAnswerButton: UIButton!
    @IBOutlet private weak var secondAnswerButton: UIButton!
    @IBOutlet private weak var thirdAnswerButton: UIButton!
    
    private struct Identifier {
        static let answer = "answer"
        static let unwindToMain = "unwindToMain"
    }
    
    // MARK: - Public
    
    var questionViewModels = [QuestionViewModel]()
    var gameManager = GameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurEffectBackground()
        displayQuestionScreen()
    }

    private func setBlurEffectBackground(){
        backgroundImageView.image = UIImage(named: "BackgroundImage")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        backgroundImageView.addSubview(blurView)
    }

    private func displayQuestionScreen() {
        pointLabel.text = gameManager.pointMessage
        if gameManager.currentIndex < questionViewModels.count - 1 {
            let question = questionViewModels[gameManager.currentIndex]
            questionImageView.downloadedFrom(url: question.imageUrl)
            firstAnswerButton.setTitle(question.firstAnswer, for: .normal)
            secondAnswerButton.setTitle(question.secondAnswer, for: .normal)
            thirdAnswerButton.setTitle(question.thirdAnswer, for: .normal)
        } else {
            performSegue(withIdentifier: Identifier.unwindToMain, sender: nil)
        }
    }

    // MARK: - Button Actions
    
    @IBAction func tapFirstAnswerButton(_ sender: Any) {
        checkAndDisplayAnswerScreen(selectedIndex: 0)
    }
    
    @IBAction func tapSecondAnswerButton(_ sender: Any) {
        checkAndDisplayAnswerScreen(selectedIndex: 1)
    }
    
    @IBAction func tapThirdAnswerButton(_ sender: Any) {
        checkAndDisplayAnswerScreen(selectedIndex: 2)
    }
    
    private func checkAndDisplayAnswerScreen(selectedIndex: Int) {
        let question = questionViewModels[gameManager.currentIndex]
        if selectedIndex == question.correctAnswerIndex {
            gameManager.currentPoint += 1
        } else {
            gameManager.currentPoint -= 1
        }
        performSegue(withIdentifier: Identifier.answer, sender: nil)
    }
    
    @IBAction func tapSkipButon(_ sender: Any) {
        gameManager.currentIndex += 1
        displayQuestionScreen()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifier.answer,
            let viewController = segue.destination as? AnswerViewController
        {
            viewController.questionViewModel = questionViewModels[gameManager.currentIndex]
            viewController.gameManager = gameManager
        } else if segue.identifier == Identifier.unwindToMain,
            let viewController = segue.destination as? MainTableViewController
        {
            viewController.gameManager = gameManager
        }
    }

    @IBAction func unwindToQuestionWithSegue(_ segue: UIStoryboardSegue) {
        displayQuestionScreen()
    }
}
