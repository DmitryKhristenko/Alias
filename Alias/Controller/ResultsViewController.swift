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
    
    var aliasGameManager: AliasGameManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func resetButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
}
