//
//  ContentTableViewCell.swift
//  AQIDemi
//
//  Created by gourav jaiswal on 24/06/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var aqiLbl: UILabel!
    @IBOutlet weak var lastUpdatedLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
