//
//  ViewController.swift
//  Flashcard App
//
//  Created by Candice Hines on 9/13/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {



    
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    var frontLabelPositionIsLeft = true
    var backLabelPositionIsLeft = true
    var didPressButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    func initializeView() {
        frontLabel.layer.masksToBounds = true
        frontLabel.layer.cornerRadius = 15
        frontLabel.layer.shadowColor = UIColor.gray.cgColor
        frontLabel.layer.shadowOpacity = 1
        frontLabel.layer.shadowOffset = .zero
        frontLabel.layer.shadowRadius = 10
        frontLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        frontLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        backLabel.layer.masksToBounds = true
        backLabel.layer.cornerRadius = 15
        backLabel.layer.shadowColor = UIColor.green.cgColor
        backLabel.layer.shadowOpacity = 1
        backLabel.layer.shadowOffset = .zero
        backLabel.layer.shadowRadius = 10
        backLabel.backgroundColor = UIColor.green.withAlphaComponent(0.1)
        backLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        backLabel.isHidden = true
        frontLabel.isHidden = false
    }
    func updateFlashcard(question: String, answer: String){
        frontLabel.text = question
        backLabel.text = answer
    }
    func updateAnswers(answerOne: String, answerTwo: String, answerThree: String, answerFour: String){
        answer1.text = answerOne
        answer2.text = answerTwo
        answer3.text = answerThree
        answer4.text = answerFour
    }
    
    @IBAction func didClickAnswerOne(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.frontLabelPositionIsLeft {
                self.frontLabel.center.x = self.view.bounds.width - 200
            }
            else {
                self.frontLabel.center.x = 200
        }
            self.frontLabelPositionIsLeft = !(self.frontLabelPositionIsLeft)
        }, completion: nil)
        
        if answer1.text == backLabel.text {
            frontLabel.isHidden = true
            backLabel.isHidden = false
            answer1.text = "Correct!"
        }
        else if answer1.text != backLabel.text {
            backLabel.isHidden = true
            frontLabel.isHidden = false
            answer1.text = "Sorry, wrong answer!"
        }
    }
    
    @IBAction func didClickAnswerTwo(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.frontLabelPositionIsLeft {
                self.frontLabel.center.x = self.view.bounds.width - 200
            }
            else {
                self.frontLabel.center.x = 200
        }
            self.frontLabelPositionIsLeft = !(self.frontLabelPositionIsLeft)
        }, completion: nil)
        
        if answer2.text == backLabel.text {
            frontLabel.isHidden = true
            backLabel.isHidden = false
            answer2.text = "Correct!"
        }
        else if answer2.text != backLabel.text {
            backLabel.isHidden = true
            frontLabel.isHidden = false
            answer2.text = "Sorry, wrong answer!"
        }
    }
    
    @IBAction func didClickAnswerThree(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.frontLabelPositionIsLeft {
                self.frontLabel.center.x = self.view.bounds.width - 200
            }
            else {
                self.frontLabel.center.x = 200
        }
            self.frontLabelPositionIsLeft = !(self.frontLabelPositionIsLeft)
        }, completion: nil)
        
        if answer3.text == backLabel.text {
            frontLabel.isHidden = true
            backLabel.isHidden = false
            answer3.text = "Correct!"
        }
        else if answer3.text != backLabel.text {
            backLabel.isHidden = true
            frontLabel.isHidden = false
            answer3.text = "Sorry, wrong answer!"
        }
    }
    
    @IBAction func didClickAnswerFour(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.frontLabelPositionIsLeft {
                self.frontLabel.center.x = self.view.bounds.width - 200
            }
            else {
                self.frontLabel.center.x = 200
        }
            self.frontLabelPositionIsLeft = !(self.frontLabelPositionIsLeft)
        }, completion: nil)
        
        if answer4.text == backLabel.text {
            frontLabel.isHidden = true
            backLabel.isHidden = false
            answer4.text = "Correct!"
        }
        else if answer4.text != backLabel.text {
            backLabel.isHidden = true
            frontLabel.isHidden = false
            answer4.text = "Sorry, wrong answer!"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardController = self
    }
}
