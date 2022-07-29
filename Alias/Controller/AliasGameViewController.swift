//
//  AliasGameViewController.swift
//  Alias
//
//  Created by Вячеслав Терентьев on 28.07.2022.
//

import UIKit

class AliasGameViewController: UIViewController {
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var wordsLabel: UILabel!
    
    var userScore = 0
    
    var aliasGameManager: AliasGameManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func correctButtonPressed() {
        userScore += 1
        scoreLabel.text = "\(userScore)"
    }
    
    @IBAction func skipButtonPressed() {
        if userScore == 0 {
            userScore = 0
        } else {
            userScore -= 1
            scoreLabel.text = "\(userScore)"
        }
    }
    
    @IBAction func resetButtonPressed() {
        scoreLabel.text = "\(0)"
        userScore = 0
    }
}
