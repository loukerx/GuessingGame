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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBlurEffectBackground()
        
           // calculate points.
    }

    private func setBlurEffectBackground(){
        backgroundImageView.image = UIImage(named: "BackgroundImage")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        backgroundImageView.addSubview(blurView)
    }

    private func displayQuestion() {
     questionImageView.image = UIImage(
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
