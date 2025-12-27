//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let hardnessSecondsDict: [String:Int] = [
//        "Soft": 5 * 60,
//        "Medium": 7 * 60,
//        "Hard": 12 * 60,
        "Soft": 3, // TODO: Remove this when you're done testing
        "Medium": 4, // TODO: Remove this when you're done testing
        "Hard": 5, // TODO: Remove this when you're done testing
    ]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let hardness = sender.titleLabel?.text else {
            print("No hardness selected")
            return
        }
        guard let seconds = hardnessSecondsDict[hardness] else {
            print("No seconds found for hardness: \(hardness)")
            return
        }
        print("Hardness selected: \(hardness). Egg will cook in \(seconds) seconds.")
        TimerManager.shared.start(seconds: seconds)
    }
    
}
