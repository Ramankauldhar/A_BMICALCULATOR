//
//  ViewOfPage.swift
//  BMIApp_iosTest
//
//  Created by setas on 2019-12-12.
//  Copyright © 2019 centennialcollege.ca. All rights reserved.
//

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
