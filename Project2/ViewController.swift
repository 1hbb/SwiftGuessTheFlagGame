//
//  ViewController.swift
//  Project2
//
//  Created by burk burs on 27.01.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Flag1: UIButton!
    
    @IBOutlet var Flag2: UIButton!
    
    @IBOutlet var Flag3: UIButton!
    
    @IBOutlet var ScoreLabel: UILabel!
    
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    var correctAnsver = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askQuestion()
        Flag1.layer.borderWidth = 1
        Flag2.layer.borderWidth = 1
        Flag3.layer.borderWidth = 1
        
        Flag1.layer.borderColor = UIColor.lightGray.cgColor
        Flag2.layer.borderColor = UIColor.lightGray.cgColor
        Flag3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        
    }
    
    func askQuestion(){
        let randomizedArray = countries.shuffled()
        correctAnsver = Int.random(in: 0...2)
        Flag1.setBackgroundImage(UIImage(named: randomizedArray[0]), for: .normal)
        Flag2.setBackgroundImage(UIImage(named: randomizedArray[1]), for: .normal)
        Flag3.setBackgroundImage(UIImage(named: randomizedArray[2]), for: .normal)
        
        ScoreLabel.text = "Score: " + String(score)
        
        title = randomizedArray[correctAnsver].uppercased()
    }
    
    @IBAction func FlagButtonTapped(_ sender: UIButton) {
        
        var title:String?
        var resultMessage:String?
        if sender.tag == correctAnsver {
            title = "Correct"
            score += 1
            resultMessage = "Your score is \(score)"
        } else{
            title = "Wrong"
            score -= 1
            resultMessage = "Thats wrong! This is \(countries[correctAnsver].uppercased()) flag!" + "Your score is \(score)"
        }
        // creating alert with UIAlertController
        let ac = UIAlertController(title: title, message:resultMessage , preferredStyle: .alert)
        
        //adding action to our alert
        ac.addAction(UIAlertAction(title: "Contiune", style: .default, handler: { (action) in
            //when user tap to any flag we will generate 3 flag again and again...
            self.askQuestion()
        }))
        
        // for presenting our action to user(this makes action to visible in UI)
        self.present(ac, animated: true)
        
    }
    
    
    
}

