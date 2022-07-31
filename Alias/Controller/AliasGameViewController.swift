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
    @IBOutlet var correctButton: UIButton!
    
    
    var aliasGameManager: AliasGameManager!
    private var timer = Timer()
    private var totalTime = 60
    private var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctButton.setTitle("Начать игру", for: .normal)
    }
    
    @IBAction func correctButtonPressed() {
        if correctButton.titleLabel?.text == "Начать игру" {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        }
        correctButton.setTitle("Правильно", for: .normal)
        aliasGameManager.scoreUp()
        updateUI()
    }
    
    @IBAction func skipButtonPressed() {
        aliasGameManager.scoreDown()
        updateUI()
    }
    
    @IBAction func resetButtonPressed() {
        

    }
    
    private func updateUI() {
        scoreLabel.text = String(aliasGameManager.score)
        wordsLabel.text = aliasGameManager.getWord()
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            timerLabel.text = String(totalTime - secondsPassed)
        } else {
            timer.invalidate()
            performSegue(withIdentifier: "showResults", sender: nil)
        }
    }
    
    
    
    }
