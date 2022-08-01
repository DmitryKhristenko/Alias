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
    @IBOutlet var skipButton: UIButton!
    
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
        
        aliasGameManager.isOn = false
        
        skipButton.isEnabled = false
        setCorrectButtonTitle("Начать игру")
        
        aliasGameManager.nextRound()
        title = "Alias Раунд # \(aliasGameManager.round)"

        secondsPassed = 0
        timerLabel.text = String(totalTime - secondsPassed)
        
        updateGameLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsVC = segue.destination as? ResultsViewController else { return }
        resultsVC.aliasGameManager = aliasGameManager
    }
    
    @IBAction func correctButtonPressed() {
        
        if !aliasGameManager.isOn {
            setCorrectButtonTitle("Правильно")
            skipButton.isEnabled = true
            aliasGameManager.isOn = true
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target:self,
                                         selector: #selector(updateTimer),
                                         userInfo:nil,
                                         repeats: true)
        } else {
            SoundManager.shared.playSound(for: .correct)
            aliasGameManager.scoreUp()
        }
        
        updateGameLabels()
    }
    
    @IBAction func skipButtonPressed() {
        SoundManager.shared.playSound(for: .skip)
        aliasGameManager.scoreDown()
        updateGameLabels()
    }
    
    @IBAction func resetButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateGameLabels() {
        scoreLabel.text = String(aliasGameManager.score)
        wordsLabel.text = aliasGameManager.getWord()
    }
    
    private func setCorrectButtonTitle(_ string: String) {
        let font = UIFont(name: "Marker Felt", size: 35) ?? .systemFont(ofSize: 35)
        let attributedText: NSAttributedString? = .init(string: string,
                                                        attributes: [.font: font,
                                                                     .foregroundColor: UIColor(hue: 2.98, saturation: 0.39, brightness: 0.32, alpha: 1)])
        correctButton.setAttributedTitle(attributedText, for: .normal)
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
