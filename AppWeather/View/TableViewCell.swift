//
//  TableViewCell.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/1/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var temperatureMin: UILabel!
    @IBOutlet weak var temperatureMax: UILabel!
    @IBOutlet weak var dayLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
