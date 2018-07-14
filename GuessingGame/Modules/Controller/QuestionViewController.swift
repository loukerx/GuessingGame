//
//  QuestionViewController.swift
//  GuessingGame
//
//  Created by Yin Hua on 10/7/18.
//  Copyright © 2018 Yin Hua. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var questionImageView: UIImageView!
    
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    
    @IBOutlet weak var secondAnswerButton: UIButton!
    
    @IBOutlet weak var thirdAnswerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setBlurEffect()
        
        //
    }

    private func setBlurEffect(){
        backgroundImageView.image = UIImage(named: "BackgroundImage")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        backgroundImageView.addSubview(blurView)
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
