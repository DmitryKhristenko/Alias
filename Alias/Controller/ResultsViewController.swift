//
//  ResultsViewController.swift
//  Alias
//
//  Created by Вячеслав Терентьев on 28.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var jokeSetupLabel: UILabel!
    @IBOutlet var jokePunchlineLabel: UILabel!
    @IBOutlet var jokeView: UIView!
    
    var aliasGameManager: AliasGameManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        JokeManager.shared.fetchJoke { joke in
            self.jokeSetupLabel.text = joke.setup
            self.jokePunchlineLabel.text = joke.punchline
            
            UIView.animate(withDuration: 0.9,
                           delay: 0.2,
                           options: .transitionCurlDown,
                           animations: {
                self.jokeView.alpha = 1.0
            },
                           completion: nil)
        }
        
        scoreLabel.text = String(aliasGameManager.score)
    }
    
    @IBAction func resetButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func continueButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}
