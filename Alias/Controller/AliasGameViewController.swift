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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateUI()
    }
    
    @IBAction func correctButtonPressed() {
        aliasGameManager.scoreUp()
        updateUI()
    }
    
    @IBAction func skipButtonPressed() {
        aliasGameManager.scoreDown()
        updateUI()
    }
    
    @IBAction func resetButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateUI() {
            scoreLabel.text = String(aliasGameManager.score)
            wordsLabel.text = aliasGameManager.getNextWord()
        }
}
