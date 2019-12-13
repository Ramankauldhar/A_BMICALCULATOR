//
//  ViewController.swift
//  BMIApp_iosTest
//
//  Created by setas on 2019-12-12.
//  Copyright © 2019 centennialcollege.ca. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    var american = false
    var ref: DatabaseReference!
    
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
    
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
          ref = Database.database().reference().child("People")
    }
    
    
    @IBAction func chaneLocation(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        if(sender.selectedSegmentIndex == 0)
        {
            american = false
        }
        else{
            american = true
        }
    }
    
    
    @IBAction func BMICalculateButton(_ sender: UIButton) {
      
        height = Double(User_Height.text!) as! Double
        weight = Double(User_Weight.text!) as! Double
        
        if(american)
        {
            weight += 20
        }
        result = (weight*703)/(height*height)
        ResultLabel.text = String(format:"%.2f",result)
        
        if (User_name.text != "") || (User_Age.text != "") || (User_Gender.text != "") || (User_Height.text != "") || (User_Weight.text != "") || (ResultLabel.text != "")
            {
                self.saveDetail()
                User_name.text = ""
                User_Age.text = ""
                User_Gender.text = ""
                User_Height.text = ""
                User_Weight.text = ""
               
            }
        
        
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
    
   func saveDetail() {
       let key = ref.childByAutoId().key!
       let details = ["name": User_name.text! as String,
                      "age": User_Age.text! as String, "gender": User_Gender.text! as String, "height":User_Height.text! as String, "weight": User_Weight.text! as String, "BMI": ResultLabel.text!]
       ref.child(key).setValue(details)
       
   }


}

