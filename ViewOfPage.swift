//File name- ViewOfPage.swift
//  Author name- Ramandeep
// App Name- BMIApp_iosTest
// Student ID- 301095150


import UIKit

class ViewOfPage: UITableViewCell {
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var BMI: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
