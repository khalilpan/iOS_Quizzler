//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var timer = Timer()

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    @IBAction func answerbuttonPressed(_ sender: UIButton) {
        timer.invalidate()

        let userAnswer = sender.currentTitle!
        let answerWasCorrect = quizBrain.chechAnswer(userAnswer)

        if answerWasCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.updateQuestion()

        // calling updateUI()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        updateAnswerButtons()
        clearButtonsbackgroundColor()
        scoreLabel.text = "Score: \(String(quizBrain.getScore()))"
        
        progressBar.progress = quizBrain.getProgress()
    }
    
    func updateAnswerButtons() {
        firstButton.setTitle(quizBrain.getAnswers()[0], for: .normal)
        secondButton.setTitle(quizBrain.getAnswers()[1], for: .normal)
        thirdButton.setTitle(quizBrain.getAnswers()[2], for: .normal)
    }
    
    func clearButtonsbackgroundColor() {
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
    }
}
