//
//  ViewController.swift
//  Bullseye
//
//  Created by Shishir P on 18/11/17.
//  Copyright © 2017 Shishir P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var difference = 0
    var targetValue = [Int]()
    var currentValue1 = 20
    var currentValue2 = 20
    var currentValue3 = 20
    var score = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func HitMeButton(_ sender: Any) {
        
        let difference = abs(targetValue[0] + targetValue[1] + targetValue[2] - currentValue1 - currentValue2 - currentValue3)
        currentValue()
        round += 1
        
        score = score + (300 - difference)
        
        let message: String ,title: String
        if difference < 5 {
           message = "You are close!!!\n Try again"
            title = "Good"
        }else if (difference < 10){
           message = "Try again"
            title = "Not Bad"
        }
        else {
         message = "not even close"
            title = "Bad"
        }
        
        let alert = UIAlertController(title: title, message: message  , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        print("the score is \(score).\n The round is \(round).\n The slider value is \(currentValue1).\n The target value is \(targetValue)")
       startNewRound()
        updateLabel()
        
    }

    @IBAction func ResetButton(_ button: UIButton) {
        score = 0
        round = 1
        startNewRound()
        updateLabel()
    
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel1: UILabel!
    @IBOutlet weak var targetLabel2: UILabel!
    @IBOutlet weak var targetLabel3: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    
    @IBAction func sliderMoved1(_ slider1: UISlider) {
        currentValue1 = lroundf(slider1.value)
    
    }
    @IBAction func sliderMoved2(_ slider2: UISlider) {
        currentValue2 = lroundf(slider2.value)

    }
    @IBAction func sliderMoved3(_ slider3: UISlider) {
        currentValue3 = lroundf(slider3.value)
        
    }
    @IBAction func InfoButton(_ button: UIButton) {
        
    }
    
    func updateLabel() {
        scoreLabel.text = String(score)
        targetLabel1.text = String(targetValue[0])
        targetLabel2.text = String(targetValue[1])
        targetLabel3.text = String(targetValue[2])
        roundLabel.text = String(round)

    }
    
    func getRandomValue() -> Int {
        return 1 + Int(arc4random_uniform(99))
    }
    func startNewRound(){
        
        for _ in 0...2 {
            let someRandomNumber = getRandomValue()
            targetValue.append(someRandomNumber)
        }
                
        slider1.value = Float(currentValue1)
        slider2.value = Float(currentValue2)
        slider3.value = Float(currentValue3)

    }
    
    func currentValue(){
        currentValue1 = lroundf(slider1.value)
        currentValue2 = lroundf(slider2.value)
        currentValue3 = lroundf(slider3.value)

    }

}
