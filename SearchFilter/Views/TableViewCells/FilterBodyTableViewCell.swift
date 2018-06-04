//
//  FilterBodyTableViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class FilterBodyTableViewCell: UITableViewCell {

    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var wholeSaleSwitch: UISwitch!
    @IBOutlet weak var wholeSaleLabel: UILabel!
    
    var filterPageDelegate : FilterPageProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func wholeSaleSwitchChanged(_ sender: Any) {
        if let wholeSholeSwitch = sender as? UISwitch{
            filterPageDelegate?.wholeSaleChanged(value: wholeSholeSwitch.isOn)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
