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

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text ?? "nil"
        let msgTitle = "button title: "
        print(msgTitle + buttonTitle )
        
//        make the dictionary to put the value for title label
        let eggTime = eggTimes[buttonTitle]
        if (eggTime != nil) {
            print(eggTime!)
        }
    }
    
}
