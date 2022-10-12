//
//  CreationViewController.swift
//  Flashcard App
//
//  Created by Candice Hines on 9/27/22.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var answerChoice1Text: UITextField!
    
    @IBOutlet weak var answerChoice2Text: UITextField!
    
    @IBOutlet weak var answerChoice3Text: UITextField!
    
    @IBOutlet weak var answerChoice4Text: UITextField!
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        let answerOneText = answerChoice1Text.text
        let answerTwoText = answerChoice2Text.text
        let answerThreeText = answerChoice3Text.text
        let answerFourText = answerChoice4Text.text
        
        flashcardController.updateAnswers(answerOne: answerOneText!, answerTwo: answerTwoText!, answerThree: answerThreeText!, answerFour: answerFourText!)
        flashcardController.updateFlashcard(question: questionText!, answer: answerText!)
        
        flashcardController.initializeView()
        dismiss(animated: true)
        flashcardController.updateLabels()
        flashcardController.updateNextPrevButtons()
        flashcardController.saveAllFlashcardsToDisk()
    }

}
