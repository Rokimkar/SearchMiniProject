//
//  FilterHeaderTableViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

protocol ButtonPressedProtocol {
    func closeButtonPressed()
}

class FilterHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailLabel: UILabel!
    var filterPageDelegate : FilterPageProtocol?
    var buttonPressedDelegate : ButtonPressedProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(detail : String,filter : SearchFilter){
        self.detailLabel.text = detail
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        buttonPressedDelegate?.closeButtonPressed()
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        filterPageDelegate?.reset()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
