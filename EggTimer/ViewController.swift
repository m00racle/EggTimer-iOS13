//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softTime = 5
    let mediumTime = 8
    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel?.text ?? "nil"
        let msgTitle = "button title: "
        print(msgTitle + buttonTitle )
    }
    
}
