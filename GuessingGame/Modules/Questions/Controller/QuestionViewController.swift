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
    
    // MARK: - Public
    
    var questionViewModels = [QuestionViewModel]()
    var currentIndex = 0
    var currentPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurEffectBackground()
        // calculate points.
        displayQuestion()
    }

    private func setBlurEffectBackground(){
        backgroundImageView.image = UIImage(named: "BackgroundImage")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        backgroundImageView.addSubview(blurView)
    }

    private func displayQuestion() {
        if currentIndex < questionViewModels.count - 1 {
            let question = questionViewModels[currentIndex]
            questionImageView.downloadedFrom(url: question.imageUrl)
            firstAnswerButton.setTitle(question.firstAnswer, for: .normal)
            secondAnswerButton.setTitle(question.secondAnswer, for: .normal)
            thirdAnswerButton.setTitle(question.thirdAnswer, for: .normal)
            
        } else {
            //perform end game.
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
        let question = questionViewModels[currentIndex]
        if selectedIndex == question.correctAnswerIndex {
            currentPoint += 1
        } else {
            currentPoint -= 1
        }
        performSegue(withIdentifier: "answer", sender: nil)
    }
    
    @IBAction func tapSkipButon(_ sender: Any) {
        currentIndex += 1
        displayQuestion() 
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "answer",
            let viewController = segue.destination as? AnswerViewController
        {
            viewController.questionViewModel = questionViewModels[currentIndex]
            viewController.currentPoint = currentPoint
            viewController.currentIndex = currentIndex
        } 
    }

}
