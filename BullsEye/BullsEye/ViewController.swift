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
    
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restartButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
     currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(){
        let message = "The value of the slider is: \(currentValue)" + "\n The target value is: \(targetValue)"
        let alert = UIAlertController(title: "Title text", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        restartButton()
    }
    
    @IBAction func restartButton() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }

}

