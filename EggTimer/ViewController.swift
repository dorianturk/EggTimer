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
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        //        if hardness == "Soft"{
        //            print(softTime)
        //        } else if hardness == "Medium"{
        //            print(mediumTime)
        //        } else if hardness == "Hard"{
        //            print(hardTime)
        //        } else {
        //            print("Error")
        //        }
        
        //        switch hardness {
        //            case "Soft":
        //                print(eggTimes["Soft"])
        //            case "Medium":
        //                print(eggTimes["Medium"])
        //            case "Hard":
        //                print(eggTimes["Hard"])
        //            default:
        //                print("Error")
        //        }
        
        print(eggTimes[hardness]!)
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        textLable.text = hardness
        progressBar.alpha = 1.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
              
        
    }

    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            textLable.text = "DONE!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
