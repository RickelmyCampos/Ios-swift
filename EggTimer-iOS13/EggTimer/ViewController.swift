//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    let eggTimes=["Soft":3,"Medium":4,"Hard":7]
    var secoundsPassed=0
    var totalTime=0
    var timer=Timer()
    var player: AVAudioPlayer?

    @IBAction func PressEgg(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime=eggTimes[hardness]!
        //secoundInitial=secondsRemaining
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    @objc func updateTimer(){
        if(secoundsPassed < totalTime){
            let percentPreogress = Float(secoundsPassed)/Float(totalTime)
            print("\(percentPreogress) seconds")
            
            progress.progress=Float(percentPreogress)
            secoundsPassed+=1
        }else{
            timer.invalidate()
            progress.progress=Float(1.0)
            print("Finalizado")
            titleLabel?.text="Finalizado"
            playSound()
            
        }
        
    }
    
}
