//
//  TickBoxTableViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 06/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

enum ShopTypeCellType{
    case official
    case goldMerchant
}

class TickBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    var cellSelectionDelegate : FilterPageProtocol?
    var cellType = ShopTypeCellType.official
    var cellSelectionState = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(detail : String,filter : SearchFilter){
        self.detailLabel.text = detail
        switch cellType {
        case .official:
            if filter.official == true{
                self.accessoryType = .checkmark
            }else{
                self.accessoryType = .none
            }
            cellSelectionState = filter.official
            break
        case .goldMerchant:
            if filter.fshop == 2{
                self.accessoryType = .checkmark
                cellSelectionState = true
            }else{
                self.accessoryType = .none
                cellSelectionState = false
            }
            break
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
            switch cellType {
            case .official:
                cellSelectionState = !cellSelectionState
                if cellSelectionState == true{
                    cellSelectionDelegate?.officialShopTypeChanged(isSelected: true)
                    self.accessoryType = .checkmark
                }else{
                    cellSelectionDelegate?.officialShopTypeChanged(isSelected: false)
                    self.accessoryType = .none
                }
                break
            case .goldMerchant:
                cellSelectionState = !cellSelectionState
                if cellSelectionState == true{
                    cellSelectionDelegate?.goldMerchantChanged(isSelected: true)
                    self.accessoryType = .checkmark
                }else{
                    cellSelectionDelegate?.goldMerchantChanged(isSelected: false)
                    self.accessoryType = .none
                }
                break
            }
        }
        
        // Configure the view for the selected state
    }
    
}
