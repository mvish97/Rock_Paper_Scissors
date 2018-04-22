//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Vishnu on 4/21/18.
//  Copyright © 2018 VV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var computerMoveLabel: UILabel!
    @IBOutlet weak var playerMoveLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var playerScore: Int = 0
    var computerScore: Int = 0
    
    var playerWin: Dictionary<String, String> = ["Rock":"Scissors", "Paper":"Rock", "Scissors":"Paper"]
    var computerWin: Dictionary<String, String> = ["Rock":"Paper", "Paper":"Scissors", "Scissors":"Rock"]
    var moves: [String] = ["Rock", "Paper", "Scissors"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetPressed(_ sender: UIButton) {
        playerScore = 0
        computerScore = 0
        scoreLabel.text = "(P) \(playerScore) - (C) \(computerScore)"
        
        playerMoveLabel.text = "~"
        computerMoveLabel.text = "~"
        
        resultLabel.text = "Result"
    }
    
    @IBAction func playerMovePressed(_ sender: UIButton) {
        let userMove = sender.titleLabel?.text as String!
        let compMove = Int(arc4random_uniform(3))
        
        playerMoveLabel.text = userMove!
        computerMoveLabel.text = moves[compMove]
        
        if playerWin[userMove!] == moves[compMove] {
            resultLabel.text = "Player Wins!"
            playerScore += 1
        }
        else if computerWin[userMove!] == moves[compMove] {
            resultLabel.text = "Computer Wins!"
            computerScore += 1
        }
        else {
            resultLabel.text = "It's a Draw"
        }
        
        scoreLabel.text = "(P) \(playerScore) - (C) \(computerScore)"
    }
    
}

