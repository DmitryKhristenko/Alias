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
    
    var aliasGameManager: AliasGameManager!
    // var aliasSoundManager: AliasSoundManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func correctButtonPressed() {
        aliasGameManager.scoreUp()
        updateUI()
        AliasSoundManager.sharedInstance.playSound(soundName: "correct")
    }
    
    @IBAction func skipButtonPressed() {
        aliasGameManager.scoreDown()
        updateUI()
        AliasSoundManager.sharedInstance.playSound(soundName: "skip")
    }
    
    @IBAction func resetButtonPressed() {
        
        
    }
    
    private func updateUI() {
        scoreLabel.text = String(aliasGameManager.score)
        wordsLabel.text = aliasGameManager.getWord()
    }
}
