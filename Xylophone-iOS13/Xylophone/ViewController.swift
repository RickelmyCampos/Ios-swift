//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    
    @IBAction func playSoundC(_ sender: UIButton) {
        playSound(sound: "C")
    }
    
    @IBAction func playSpundD(_ sender: UIButton) {
        playSound(sound: "D")
    }
    @IBAction func playSoundE(_ sender: UIButton) {
        playSound(sound: "E")
    }
    @IBAction func playSoundF(_ sender: UIButton) {
        playSound(sound: "F")
    }
    @IBAction func playSoundG(_ sender: UIButton) {
        playSound(sound: "G")
    }
    @IBAction func playSoundA(_ sender: UIButton) {
        playSound(sound: "A")
    }
    @IBAction func playSoundB(_ sender: UIButton) {
        playSound(sound: "B")
    }
    func playSound(sound:String){
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else {return}
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player=try AVAudioPlayer(contentsOf: url,fileTypeHint: AVFileType.wav.rawValue.lowercased())
            guard let player = player else {return}
            player.play()
            
        }catch let error{
            print(error.localizedDescription)
        }
                
    }
    

}

