//File name- ViewController.swift
//  Author name- Ramandeep
// App Name- BMIApp_iosTest
// Student ID- 301095150


import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   //declaring and initializing the variable to get american
    var american = false
    //declare a referance variable to get reference to database
    var ref: DatabaseReference!

    //decalre and initialize the variables of type double to store values in these all
    var height: Double = 0.0
    var weight: Double = 0.0
    var BMI: Double = 0.0
    
    //connecting the data feilds with code
    @IBOutlet weak var User_name: UITextField!
    
    @IBOutlet weak var User_Age: UITextField!
    
    @IBOutlet weak var User_Gender: UITextField!
    
    @IBOutlet weak var User_Height: UITextField!
    
    @IBOutlet weak var User_Weight: UITextField!
    
    //connecting the label of resultof BMI
    @IBOutlet weak var ResultLabel: UILabel!
    //connecting the label to display BMI message
    @IBOutlet weak var BMIMessageLabel: UILabel!
    
    //connecting the table view
    @IBOutlet weak var TableView: UITableView!
  
    //ctreating a list of array
       var LIST : [BMIResult] = []
    
       override func viewDidLoad() {
           super.viewDidLoad()
          TableView.delegate = self
          TableView.dataSource = self
     //calling the fuction to get the user's detail, stored in database
          RetrieveUserDetails()
     // calling the fuction to get user's BMI result, stored in database
          RetrieveBmIResult()
    }
    
    //Change location fuction
    @IBAction func chaneLocation(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        //condition to check the segment's index, if it is Zero(0)
        if(sender.selectedSegmentIndex == 0)
        {
            //then world calculation willbe done not ameriacn
            american = false
        }
        else{
            //otherwise american result would be calculated
            american = true
        }
    }
    
    // fuction to Retrieve the user's dertails from database
    func RetrieveUserDetails(){
           //by calling the firebase Api class, im getting the user's details
           FirebaseAPIforBMIcalculator().getUser { (name,age, gender, weight, height) in
               
            //setting the all values to text fields
               self.User_name.text = name
                
               self.User_Age.text = age
                
               self.User_Gender.text = gender
               
              self.User_Weight.text = String(weight)
               
              self.User_Height.text = String(height)
           // printing the meassage
                   print(weight.toString())
                   print(height.toString())
           }
       }
    
    //fuction to retrieve the BMI result of person
    func RetrieveBmIResult(){
         
         LIST = []
            //by using API , im getting the all BMI result of a perticular user that i already stored in database
         FirebaseAPIforBMIcalculator().getAllBMIResults(callback: { (allResultsFoundOnFirebase) in
             self.LIST = allResultsFoundOnFirebase
                 self.TableView.reloadData()
         })
     }
    
    //button action to calculate the BMI of person
    @IBAction func BMICalculateButton(_ sender: UIButton) {
        //saving the text of all fields in variables
        weight = Double(User_Weight.text!) as! Double
        height = Double(User_Height.text!) as! Double
       // checking if american has selected
        if(american)
        {
            //if selected the im adding 20 more in weight
            weight += 20
        }
        //Calculating thge BMI
        BMI = (weight*703)/(height*height)
        //setting the BMI result in Result label
        ResultLabel.text = String(format:"%.2f",BMI)
        
        //If BMI of person is less then 16
        if(BMI < 16)
        {
            //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("Severe Thinness")
        }
        //If BMI of person is 16-17
        if(BMI >= 16 && BMI <= 17)
        {
             //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("Moderate Thinness")
        }
        //If BMI of person is 17-18.5
        if(BMI >= 17 && BMI <= 18.5)
        {
             //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("Mild Thinness")
        }
        //If BMI of person is 18.5-25
        if(BMI >= 18.5 && BMI <= 25)
        {
             //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("Normal")
        }
        //If BMI of person is 25-30
        if(BMI >= 25 && BMI <= 30)
        {
             //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("OverWeight")
        }
        //If BMI of person is 30-35
        if(BMI >= 30 && BMI <= 35)
        {
             //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("Obese Class 1")
        }
        //If BMI of person is 35-40
        if(BMI >= 35 && BMI <= 40)
        {
             //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("Obese Class 2")
        }
        //If BMI of person is greather then 40
        if(BMI > 40)
        {
             //this message will print out in BMIMESSAGELAbel
            BMIMessageLabel.text = String("Obese Class 3")
        }
    }
    
    //action on save the details button
    @IBAction func SaveUserDetails(_ sender: UIButton) {
        //saving the result in different variable by getting data from text fields
           guard let name = self.User_name.text else { return }
           guard let age = self.User_Age.text else { return }
           guard let gender = self.User_Gender.text else { return }
           //saving the all values in database with "key and value" form
           FirebaseAPIforBMIcalculator().saveUser(withName: name, age: age, gender: gender, weight: weight, height: height) { (success, error) in
        }
    }
    
    //action on saveBMI button (this button will save the Multiple BMI result )
    @IBAction func SaveBMI(_ sender: UIButton) {
        if BMI == 0.0 || weight == 0.0 || height == 00 {
                  return
              }
              //saving the all values in database with "key and value" form
              FirebaseAPIforBMIcalculator().saveNewBMIReport(with: weight, height: height, BMI: BMI) { (success, error) in
                  self.RetrieveUserDetails()
              }
    }
    //action on delete button to delete all record
    @IBAction func deleteAllData(_ sender: UIBarButtonItem) {
        //deletign all the BMI result
              FirebaseAPIforBMIcalculator().deleteAllResults { (success, error) in
                  self.LIST.removeAll()
                  self.TableView.reloadData()
                  self.RetrieveBmIResult()
              }
    }
    
    //fuction of number of rowinSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returning the resulr accoring to Item of list
        return LIST.count
    }
    //function to describe numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //fuction to display list in table rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
         let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)

         let resultBMI = LIST[indexPath.row]
        //saving the values in a variable
        let Description = "Weight: " + resultBMI.weight.toString() + " Height: " + resultBMI.height.toString() + " BMI: " + resultBMI.BMI.toString()
        //saving the all resul in a label
        cell.textLabel?.text = Description
               
        return cell
    }
    //fuction to edit something in row(im addingb delete button)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if (editingStyle == .delete) {
                      
                      let resultBMI = LIST[indexPath.row]
                   //deletign the data from a single row
                   FirebaseAPIforBMIcalculator().deleteResult(BMIRecordID: resultBMI.id) { (success, error) in
                       self.RetrieveBmIResult()
                   }
                   
                   LIST.remove(at: indexPath.row)

                }
    }
    
}

