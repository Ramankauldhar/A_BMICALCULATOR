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
    
    @IBAction func BMICalculateButton(_ sender: UIButton) {
        height = Double(User_Height.text!) as! Double
        weight = Double(User_Weight.text!) as! Double
        result = (weight*703)/(height*height)
        ResultLabel.text = String(format:"%.2f",result)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

