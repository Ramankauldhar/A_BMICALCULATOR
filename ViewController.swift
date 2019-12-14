//File name- ViewController.swift
//  Author name- Ramandeep
// App Name- BMIApp_iosTest
// Student ID- 301095150


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
        getUser()
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
    saveBMI()
    saveUser()
      /* let key = "User"//= ref.childByAutoId().key!
       let details = ["name": User_name.text! as String,
                      "age": User_Age.text! as String, "gender": User_Gender.text! as String, "height":User_Height.text! as String, "weight": User_Weight.text! as String, "BMI": ResultLabel.text!]
       ref.child(key).setValue(details)*/
       
   }
    func saveBMI(){
        let BMI = ref.child("BMI")
        let key =  BMI.childByAutoId().key!
             let details = ["BMI":ResultLabel.text! as String,
                            ]
        BMI.childByAutoId().setValue(details)
        //ref.child("BMI")setValue(details)
    }
    func getUser() {
        
        let other = Database.database().reference(withPath: "People")

        other.observe(.value) { (snapshot) in
            

            if !snapshot.exists() { return }

            let user = snapshot.childSnapshot(forPath: "User") // Its print all values including Snap (User)

            print(snapshot.value!)
            
          //  let a = user.children


         /*   if let json = user as? [String : Any] {
                           if let name = json["name"] as? String {
                               self.User_name.text = name
                           }
            }*/
           
           self.User_name.text = snapshot.value(forKeyPath: "User.name") as! String
//
//            self.User_Age.text = user.value(forKey: "age") as! String
//            self.User_Gender.text = user.value(forKey: "gender") as! String
//            self.User_Height.text = user.value(forKey: "height") as! String
//            self.User_Weight.text = user.value(forKey: "weight") as! String

            
            

          

        }
      
        
    }
    
    func saveUser(){
        let key = "User"//= ref.childByAutoId().key!
             let details = ["name": User_name.text! as String,
                            "age": User_Age.text! as String,
                            "gender": User_Gender.text! as String,
                            "height":User_Height.text! as String,
                            "weight": User_Weight.text! as String]
             ref.child(key).setValue(details)
    }

    
    
    func getUserFromDatabase(){
               
           let ref = Database.database().reference(withPath: "People")
                   
        ref.observeSingleEvent(of: .value){
                    
                   (snapshot) in
                    let user = snapshot.childSnapshot(forPath: "User")
                    print(user.value(forKey: "age"))
            

               }
    }
       
    
    

}

