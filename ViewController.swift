//
//  ViewController.swift
//  BMIAPPTEST
//
//  Created by SETAS on 2019-12-11.
//  Copyright © 2019 CentennialCollege. All rights reserved.
//

import UIKit

//initializing the variables
private var heightt: Double = 0.0
private var weight: Double = 0.0
private var result: Double = 0.0

class ViewController: UIViewController {
    
    //connecting the UIFields
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var UserAge: UITextField!
    @IBOutlet weak var UserGender: UITextField!
    @IBOutlet weak var UserHeight: UITextField!
    @IBOutlet weak var UserWeight: UITextField!
    @IBOutlet weak var resultlabel: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    //saving the value
    heightt = Double(UserHeight.text!) as! Double
    weight = Double(UserWeight.text!) as! Double
    result = (weight*703)/(height*height)
    resultlabel.text = String(result)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

