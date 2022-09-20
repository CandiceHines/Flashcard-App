//
//  ViewController.swift
//  Flashcard App
//
//  Created by Candice Hines on 9/13/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        question1.layer.cornerRadius = 15
        question1.layer.shadowColor = UIColor.gray.cgColor
        question1.layer.shadowOpacity = 1
        question1.layer.shadowOffset = .zero
        question1.layer.shadowRadius = 10
        question1.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        question1.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    @IBOutlet weak var Logo1: UITextField!
    @IBOutlet weak var question1: UITextField!
    @IBOutlet weak var logo: UITextField!
    var question1PositionisLeft = true
    @IBAction func ans1(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.question1PositionisLeft {
                self.question1.center.x = self.view.bounds.width - 200
            }
            else {
                self.question1.center.x = 200
        }
            self.question1PositionisLeft = !(self.question1PositionisLeft)
        }, completion: nil)
        sender.setTitle("SORRY, WRONG ANSWER!", for: .normal)
        sender.setTitleColor(UIColor.red, for:.normal)
    }
    @IBAction func ans2(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.question1PositionisLeft {
                self.question1.center.x = self.view.bounds.width - 200
            }
            else {
                self.question1.center.x = 200
        }
            self.question1PositionisLeft = !(self.question1PositionisLeft)
        }, completion: nil)
        question1.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.3)
        question1.text = ("ROME ✅")
        sender.setTitle("CORRECT!!!", for: .normal)
        
    }
    @IBAction func ans3(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.question1PositionisLeft {
                self.question1.center.x = self.view.bounds.width - 200
            }
            else {
                self.question1.center.x = 200
        }
            self.question1PositionisLeft = !(self.question1PositionisLeft)
        }, completion: nil)
        sender.setTitle("SORRY, WRONG ANSWER!", for: .normal)
        sender.setTitleColor(UIColor.red, for:.normal)
    }
    @IBAction func ans4(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 200, options: .curveEaseIn, animations: {
            if self.question1PositionisLeft {
                self.question1.center.x = self.view.bounds.width - 200
            }
            else {
                self.question1.center.x = 200
        }
            self.question1PositionisLeft = !(self.question1PositionisLeft)
        }, completion: nil)
        sender.setTitle("SORRY, WRONG ANSWER!", for: .normal)
        sender.setTitleColor(UIColor.red, for:.normal)
    }

}
