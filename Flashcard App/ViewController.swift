//
//  ViewController.swift
//  Flashcard App
//
//  Created by Candice Hines on 9/13/22.
//

import UIKit
import SwiftUI

struct Flashcard {
    var question: String
    var answer: String
    var answerOne: String
    var answerTwo: String
    var answerThree: String
    var answerFour: String
}

class ViewController: UIViewController {



    
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    @IBAction func didTapOnPrev(_ sender: Any) {
        initializeView()
        currentIndex = currentIndex - 1
        
        updateLabels()
 
        
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        
        updateLabels()
        
        updateNextPrevButtons()
    }
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    var frontLabelPositionIsLeft = true
    var backLabelPositionIsLeft = true
    var didPressButton = false
    
    var flashcards = [Flashcard] ()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "Where are the catacombs located?", answer: "Rome")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        updateAnswers(answerOne: "Egypt", answerTwo: "Brazil", answerThree: "Africa", answerFour: "Rome")
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
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    func updateFlashcard(question: String, answer: String){
        let flashcard = Flashcard(question: question, answer: answer, answerOne: answer, answerTwo: answer, answerThree: answer, answerFour: answer)
        frontLabel.text = question
        backLabel.text = answer
        flashcards.append(flashcard)
        print("Added a new FlashCard, take a look!", flashcards)
        
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        
        updateLabels()
    }
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    func saveAllFlashcardsToSick() {
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer, "answer one": card.answerOne, "answer two": card.answerTwo, "answer 3": card.answerThree, "answer 4": card.answerFour]
        }
        UserDefaults.standard.set(flashcards, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults!")
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.set(flashcards, forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, answerOne: dictionary["answer one"]!, answerTwo: dictionary["answer two"]!, answerThree: dictionary["answer 3"]!, answerFour: dictionary["answer 4"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
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
