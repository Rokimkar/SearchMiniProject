//
//  FilterHeaderTableViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

class FilterHeaderTableViewCell: UITableViewCell {
    
    var filterPageDelegate : FilterPageProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBAction func closeButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        filterPageDelegate?.reset()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
