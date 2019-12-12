//
//  ViewController.swift
//  BMIApp_iosTest
//
//  Created by setas on 2019-12-12.
//  Copyright © 2019 centennialcollege.ca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 private var height: Double = 0.0
 private var weight: Double = 0.0
 private var result: Double = 0.0
    
    @IBOutlet weak var User_name: UITextField!
    
    @IBOutlet weak var User_Age: UITextField!
    
    @IBOutlet weak var User_Gender: UITextField!
    
    @IBOutlet weak var User_Height: UITextField!
    
    @IBOutlet weak var User_Weight: UITextField!
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBOutlet weak var BMIMessageLabel: UILabel!
    
    @IBAction func BMICalculateButton(_ sender: UIButton) {
        height = Double(User_Height.text!) as! Double
        weight = Double(User_Weight.text!) as! Double
        result = (weight*703)/(height*height)
        ResultLabel.text = String(format:"%.2f",result)
        
        if(result < 16)
        {
            BMIMessageLabel.text = String("Severe Thinness")
        }
        if(result >= 16 && result <= 17)
        {
            BMIMessageLabel.text = String("Moderate Thinness")
        }
        if(result >= 17 && result <= 18.5)
        {
            BMIMessageLabel.text = String("Mild Thinness")
        }
        if(result >= 18.5 && result <= 25)
        {
            BMIMessageLabel.text = String("Normal")
        }
        if(result >= 25 && result <= 30)
        {
            BMIMessageLabel.text = String("OverWeight")
        }
        if(result >= 30 && result <= 35)
        {
            BMIMessageLabel.text = String("Obese Class 1")
        }
        if(result >= 35 && result <= 40)
        {
            BMIMessageLabel.text = String("Obese Class 2")
        }
        if(result > 40)
        {
            BMIMessageLabel.text = String("Obese Class 3")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

