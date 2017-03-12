//
//  ViewController.swift
//  BullsEye
//
//  Created by Dmitry Cherkasov on 3/12/17.
//  Copyright © 2017 Dmitry Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundNumberLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var roundNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restartButton()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
     currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(){
        let diff = abs(targetValue - currentValue)
        let points = 100 - diff
        
        score += points
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: "Title text", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        restartButton()
        updateLabels()
    }
    
    @IBAction func restartButton() {
        roundNumber += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        roundNumberLabel.text = String(roundNumber)
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }

}

