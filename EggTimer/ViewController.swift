//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

//import AVFoundation to sound the alarm
import AVFoundation

class ViewController: UIViewController {
//    let softTime = 5*60
//    let mediumTime = 8*60
//    let hardTime = 12*60
    
//    make dictionary on eggTime:
//    NOTE: THIS IS FOR THE LABEL TITLE CHANGE TO DONE DEBUG
//    TODO: TO MAKE IT BACK TO NORMAL JUST ADD * 60 DEBUG
    let eggTimes = ["Soft":5,
                    "Medium":8,
                    "Hard":12]
    
//    mske timer variables:
    var seconds = 0
    var startTime = 0
    var timer = Timer()
    var isTimerRun = false
    @IBOutlet weak var titleLabel: NSLayoutConstraint!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var theLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        prevent: each time I press the button the timer reset but the speed is getting faster!
        timer.invalidate()
        
        let buttonTitle = sender.titleLabel?.text ?? "nil"
        
//        debug purposes clean up afterwards!
        let msgTitle = "button title: "
        print(msgTitle + buttonTitle )
        
//        the label should point out the egg hardness selected
        theLabel.text = buttonTitle
        
//        make the dictionary to put the value for title label
        let eggTime = eggTimes[buttonTitle]
        if (eggTime != nil) {
            
//            if egg time is not nil then put it as startTime
            startTime = eggTime!
            
        }
        
//        make the progress bar turn to 0.0
        progressBar.progress = 0.0
//        timer run
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds >= startTime {
//            put the warning sign Done
            self.theLabel.text = "Done!"
            
//            sound the alarm
            soundAlarm()
            
//            set the seconds back to 0 this is not done automatically when invalidate the timer!
            seconds = 0
            
//            invalidate the timer!
            timer.invalidate()
        }
        else {
            seconds += 1
//            print the seconds DEBUG
            print(seconds)
//            express the seconds into progress
//            view it in the progressBar
//            NOTE: YOU NEED TO CHANGE THE VARIABLES (startTime and seconds) TO FLOAT EACH NOT IN THE FINAL RESULT OF THE CALCULATIONS
            progressBar.progress = Float(seconds)/Float(startTime)
        }
    }
    
    var player:AVAudioPlayer? //set variable named player (type of AVAudioPlayer)
    
    func soundAlarm() {
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
    
}
