//
//  AnswerViewController.swift
//  GuessingGame
//
//  Created by Yin Hua on 10/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import UIKit
import SafariServices

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var standFirstLabel: UILabel!
    
    private struct Identifier {
        static let unwindToQuestion = "unwindToQuestion"
    }
    
    // MARK: - Public 
    var questionViewModel: QuestionViewModel?
    var gameManager = GameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurEffect()
        displayAnswer()
    }

    private func setBlurEffect(){
        backgroundImageView.image = UIImage(named: "BackgroundImage")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        backgroundImageView.addSubview(blurView)
    }
    
    private func displayAnswer() {
        pointLabel.text = gameManager.pointMessage
        if let question = questionViewModel {
            questionImageView.downloadedFrom(url: question.imageUrl)
            standFirstLabel.text = question.standFirst
        }
    }
    
    @IBAction func tapReadArticleButton(_ sender: Any) {
        if let question = questionViewModel {
            let safariViewController = SFSafariViewController(url: question.storyUrl)
            self.present(safariViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Identifier.unwindToQuestion,
            let viewController = segue.destination as? QuestionViewController
        {
            gameManager.currentIndex += 1
            viewController.gameManager = gameManager
        }
    }

}
