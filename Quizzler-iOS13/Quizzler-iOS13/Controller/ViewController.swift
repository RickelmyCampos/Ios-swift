//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textScore: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    
    var quizBrain=QuizBrain()
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //count = quiz.count
        //progressBar.setProgress(0.1, animated: true)
        // Do any additional setup after loading the view.
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight=quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight{
            
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target:self 	, selector:#selector(updateUi) , userInfo: nil, repeats: false)
        
        //updateUi()
        
        
    }
    @objc func updateUi(){
        questionText.text=quizBrain.getQuestionText()
        trueButton.backgroundColor=UIColor.clear
        falseButton.backgroundColor=UIColor.clear
        progressBar.progress=quizBrain.getProgress()
        textScore.text="Score : \(quizBrain.getScore())"
    }
    
    
}

