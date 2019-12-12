//
//  ViewController.swift
//  BMIAPPTEST
//
//  Created by SETAS on 2019-12-11.
//  Copyright © 2019 CentennialCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //initializing variables
    private var U_height: Double = 0.0
    private var U_weight: Double = 0.0
    private var U_result: Double = 0.0
    
    //connecting filed
    @IBOutlet weak var User_name: UITextField!
    
    @IBOutlet weak var User_age: UITextField!
    
    @IBOutlet weak var User_Gender: UITextField!
    
    @IBOutlet weak var User_weight: UITextField!
    
    @IBOutlet weak var User_Height: UITextField!
    
    //connecting labels
    @IBOutlet weak var Calculateresult: UILabel!
    
    @IBOutlet weak var Message: UILabel!
    
    //perform action on done(Calculate button)
    @IBAction func donebutton(_ sender: Any) {
        U_height = Double(User_Height.text!) as! Double
        U_weight = Double(User_weight.text!) as! Double
        U_result = (U_weight*703)/(U_height*U_height)
        Calculateresult.text = String (U_result)
        
        if(U_result < 16)
        {
            Message.text = String("Severe Thinness")
        }
        if(U_result >= 16 && U_result <= 17)
        {
            Message.text = String("Moderate Thiness")
        }
        if(U_result >= 17 && U_result <= 18.5 )
        {
             Message.text = String("Mild Thiness")
        }
        if(U_result >= 18.5 && U_result <= 25 )
        {
            Message.text = String("Normal")
        }
        if(U_result >= 25 && U_result <= 30 )
        {
            Message.text = String("OverWeight")
        }
        if(U_result >= 30 && U_result <= 35 )
        {
            Message.text = String("Obese class 1")
        }
        if(U_result >= 35 && U_result <= 40 )
        {
            Message.text = String("Obese class 2")
        }
        if(U_result > 40 )
        {
            Message.text = String("Obese class 3")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

