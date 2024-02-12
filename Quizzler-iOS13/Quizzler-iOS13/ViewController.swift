//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
     var questionNumber=0
    let quiz=[
    ["2 + 5 = 10?","False"],
    ["20+4 = 24?","True"],
    ["38+25 = 102?","False"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if(userAnswer==actualAnswer){
           
            print("Certo")
        }else{
            print("Errado")
        }
        if(questionNumber+1<quiz.count){
            questionNumber+=1
        }else{
            questionNumber=0
        }
        
        updateUi()
        

    }
    func updateUi(){
        questionText.text=quiz[questionNumber][0]
    }
    
}

