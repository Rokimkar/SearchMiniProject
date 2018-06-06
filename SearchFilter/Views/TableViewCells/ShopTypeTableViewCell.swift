//
//  ShopTypeTableViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 04/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class ShopTypeTableViewCell: UITableViewCell {

    var filterPageDelegate : FilterPageProtocol?
    
    @IBOutlet weak var officialSwitch: UISwitch!
    @IBOutlet weak var goldMerchantSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(with filter : SearchFilter){
        officialSwitch.isOn = filter.official
        if filter.fshop == 2{
            goldMerchantSwitch.isOn = true
        }else{
            goldMerchantSwitch.isOn = false
        }
    }

    @IBAction func goldMerchantSwitchChanged(_ sender: Any) {
        var state = false
        if let switchState = sender as? UISwitch{
            state = switchState.isOn
            filterPageDelegate?.goldMerchantChanged(isSelected: state)
        }
    }
    
    @IBAction func officialStoreSwitchChanged(_ sender: Any) {
        var state = false
        if let switchState = sender as? UISwitch{
            state = switchState.isOn
            filterPageDelegate?.officialShopTypeChanged(isSelected: state)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
