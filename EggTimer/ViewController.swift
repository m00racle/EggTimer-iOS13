//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    let softTime = 5*60
//    let mediumTime = 8*60
//    let hardTime = 12*60
    
//    make dictionary on eggTime:
    let eggTimes = ["Soft":5*60,
                    "Medium":8*60,
                    "Hard":12*60]
    
//    mske timer variables:
    var seconds = 60
    var timer = Timer()
    var isTimerRun = false

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text ?? "nil"
        let msgTitle = "button title: "
        print(msgTitle + buttonTitle )
        
//        make the dictionary to put the value for title label
        let eggTime = eggTimes[buttonTitle]
        if (eggTime != nil) {
            print(eggTime!)
        }
//        timer run
        runTimer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        print(seconds)
    }
    
}
