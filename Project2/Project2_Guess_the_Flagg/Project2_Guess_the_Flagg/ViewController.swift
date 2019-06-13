//
//  ViewController.swift
//  Project2_Guess_the_Flagg
//
//  Created by Erwin Warkentin on 13.06.19.
//  Copyright © 2019 Erwin Warkentin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score: Int = 0
    var correctAnswer = 0
     var rounds = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
//create a border for the Flags
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
//create a color for the border
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        askQuestion()
    }

//give the button an Image
    func askQuestion(action: UIAlertAction! = nil ) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "what is \(countries[correctAnswer].uppercased())?                     score is \(score)"
        
//after 10 rounds Alert!!!!
        if rounds == 10 {
            let alert = UIAlertController(title: "Alert", message: "this is your \(rounds). round!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default))
            
            present(alert, animated: true)
        }
    
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
       
//massages when a flag was tapped
        if sender.tag == correctAnswer {
            title = "Correct Answer"
            score += 1
            rounds += 1
        } else {
            title = "Wrong this was \(countries[sender.tag])"
            score -= 1
            rounds += 1
            if score <= 0 {
                score = 0
               
            }
        }
        
//Add Allert in effect of press a Flag
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
      
    }
    
    
    

}

