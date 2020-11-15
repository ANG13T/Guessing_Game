//
//  ViewController.swift
//  GuessingGame
//
//  Created by Angelina Tsuboi on 11/14/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    let label = UILabel()
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "us", "uk", "spain", "italy", "poland", "nigeria", "monaco"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        label.textColor = UIColor.blue
        label.text = "Score: 0";
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func startOver(action: UIAlertAction! = nil){
        correctAnswer = 0
        score = 0
        questionsAsked = 0
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        questionsAsked += 1
        
        if(sender.tag == correctAnswer){
            title = "Correct!"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
        }
        
        label.text = "Score: \(score)";
        
        if(questionsAsked == 10){
            let finalAC = UIAlertController(title: "Game Complete!", message: "You got \(score) out of 10 questions right", preferredStyle: .alert)
            finalAC.addAction(UIAlertAction(title: "Play Again", style: .default, handler: startOver))
            present(finalAC, animated: true)
        }else{
            let ac = UIAlertController(title: "Answer was \(countries[correctAnswer])", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    

}

