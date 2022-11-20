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
    
    @IBOutlet weak var progressBarr: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard":12]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func handleClick(_ sender: UIButton) {
        progressBarr.progress = 0
        secondPassed = 0
        timer.invalidate()
        let hardnes = sender.currentTitle!
        titleLabel.text = hardnes
        totalTime = eggTimes[hardnes]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer (){
       if secondPassed < totalTime{
           secondPassed += 1
           let percentageProgress = Float(secondPassed) / Float(totalTime)
           progressBarr.progress = Float(percentageProgress)
       }else{
           timer.invalidate()
           titleLabel.text = "DONE!"
           
           let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
       }
    }
    
    
    

}
