//
//  WeatherTableViewCell.swift
//  Practice
//
//  Created by Ramesh Rajendran on 5/5/25.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var minTemp: UILabel!
    @IBOutlet var maxTemp: UILabel!
    @IBOutlet var Temp: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
