//File name- GetdetailsViewController.swift
//  Author name- Ramandeep
// App Name- BMIApp_iosTest
// Student ID- 301095150


import UIKit
import FirebaseDatabase

struct List{
    var weight: String
    var BMI: String
}

class GetdetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UITabBarControllerDelegate {
    
    
    @IBOutlet weak var TableVieww: UITableView!
    
     var DetailList : [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableVieww.delegate = self
        TableVieww.dataSource = self
           
             //calling this fuction to load the todo at staring
             viewdetail()
    }

    func viewdetail(){
            
        let ref = Database.database().reference(withPath: "People")
                ref.observeSingleEvent(of: .value){
                (snapshot) in
                for child in snapshot.children.allObjects as! [DataSnapshot]{
                    if let json = child.value as? [String:Any] {
                        print(json)
                        var BMI = ""
                        if let BMIFirebase = json["BMI"] as? String {
                            BMI = BMIFirebase
                        }
                        var weight = ""
                        if let weightFirebase = json["weight"] as? String {
                            weight = weightFirebase
                        }
                        self.DetailList.append(List(weight: weight, BMI: BMI))

                    }
                    self.TableVieww.reloadData()

                /*let weight = child.key
                let BMI = child.key
                let detailref = ref.child(weight).child(BMI)
                detailref.observeSingleEvent(of: .value, with: {(snapshot) in
                let value = snapshot.value as? NSDictionary
                self.DetailList.append(List(weight: weight, BMI: BMI))
                    
                })*/
            }}}
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return DetailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! ViewOfPage
        cell.weight.text = DetailList[indexPath.row].weight
        cell.BMI.text = DetailList[indexPath.row].BMI
        return cell
       }
       //fuction to remove data from row
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete{

               let ref = Database.database().reference(withPath: "People")
               ref.removeValue()
               DetailList.remove(at: indexPath.row)
               TableVieww.reloadData()
           }
       }
}
