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
    var selectedShopType : ShopType = .both
    
    @IBOutlet weak var officialSwitch: UISwitch!
    @IBOutlet weak var goldMerchantSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(with filter : SearchFilter){
        if filter.fshop == 2{
            selectedShopType = .both
            officialSwitch.isOn = true
            goldMerchantSwitch.isOn = true
        }else if filter.fshop == 1{
            selectedShopType = .goldMerchant
            officialSwitch.isOn = false
            goldMerchantSwitch.isOn = true
        }else if filter.fshop == 0{
            selectedShopType = .official
            officialSwitch.isOn = true
            goldMerchantSwitch.isOn = false
        }
    }

    @IBAction func goldMerchantSwitchChanged(_ sender: Any) {
        var state = false
        if let switchState = sender as? UISwitch{
            state = switchState.isOn
            if state == false && selectedShopType == .both{
                selectedShopType = .official
            }else{
                selectedShopType = .both
            }
            filterPageDelegate?.shopTypeChanged(type: selectedShopType)
        }
        setSwitchState()
    }
    
    @IBAction func officialStoreSwitchChanged(_ sender: Any) {
        var state = false
        if let switchState = sender as? UISwitch{
            state = switchState.isOn
            if state == false && selectedShopType == .both{
                selectedShopType = .goldMerchant
            }else{
                selectedShopType = .both
            }
            filterPageDelegate?.shopTypeChanged(type: selectedShopType)
        }
        setSwitchState()
    }
    
    func setSwitchState(){
        switch selectedShopType {
        case .official:
            officialSwitch.isOn = true
            goldMerchantSwitch.isOn = false
            break
        case .goldMerchant:
            officialSwitch.isOn = false
            goldMerchantSwitch.isOn = true
            break
        case .both:
            officialSwitch.isOn = true
            goldMerchantSwitch.isOn = true
            break
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
