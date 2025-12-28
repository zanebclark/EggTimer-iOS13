//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let hardnessSecondsDict: [String:Int] = [
        "Soft": 5 * 60,
        "Medium": 7 * 60,
        "Hard": 12 * 60,
    ]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        self.titleLabel.text = "How do you like your eggs?"
        self.progressBar.progress = 0.0
        guard let hardness = sender.titleLabel?.text else {
            print("No hardness selected")
            return
        }
        guard let seconds = hardnessSecondsDict[hardness] else {
            print("No seconds found for hardness: \(hardness)")
            return
        }
        print("Hardness selected: \(hardness). Egg will cook in \(seconds) seconds.")
        TimerManager.shared.start(seconds: seconds, progressBar: self.progressBar) { [weak self] in
            self?.titleLabel.text = "Done!"
        }
    }
    
}
