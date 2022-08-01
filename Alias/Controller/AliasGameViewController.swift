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
        navigationItem.hidesBackButton = true
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        secondsPassed = 0
        let font = UIFont(name: "Marker Felt", size: 35) ?? .systemFont(ofSize: 35)
        let attributedText: NSAttributedString? = .init(string: "Начать игру",
                                                        attributes: [.font: font,
                                                                     .foregroundColor: UIColor.green])
        correctButton.setAttributedTitle(attributedText, for: .normal)
        timerLabel.text = String(totalTime - secondsPassed)
    }
    
    @IBAction func correctButtonPressed() {
        if correctButton.titleLabel?.text == "Начать игру" {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        }
        
        let font = UIFont(name: "Marker Felt", size: 35) ?? .systemFont(ofSize: 35)
        let attributedText: NSAttributedString? = .init(string: "Правильно",
                                                        attributes: [.font: font,
                                                                     .foregroundColor: UIColor.green])
        correctButton.setAttributedTitle(attributedText, for: .normal)
        SoundManager.shared.playSound(for: .correct)
        aliasGameManager.scoreUp()
        updateUI()
    }
    
    @IBAction func skipButtonPressed() {
        SoundManager.shared.playSound(for: .skip)
        aliasGameManager.scoreDown()
        updateUI()
    }
    
    @IBAction func resetButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
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
