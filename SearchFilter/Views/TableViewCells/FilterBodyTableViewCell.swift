//
//  FilterBodyTableViewCell.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit
import MARKRangeSlider

class FilterBodyTableViewCell: UITableViewCell {

    @IBOutlet weak var maxPriceLabel: UILabel!
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var wholeSaleSwitch: UISwitch!
    @IBOutlet weak var wholeSaleLabel: UILabel!
    @IBOutlet weak var rangeSlider: MARKRangeSlider!
    
    var filterPageDelegate : FilterPageProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
        // Initialization code
    }
    
    func commonInit(){
        rangeSlider.setMinValue(100, maxValue: 80000)
        rangeSlider.minimumDistance = 100
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueDidChange), for: .valueChanged)
        rangeSliderValueDidChange()
        minPriceLabel.numberOfLines = 0
        maxPriceLabel.numberOfLines = 0
    }
    
    @objc func rangeSliderValueDidChange(){
        updateMinPriceLabel(value: rangeSlider.leftValue)
        updateMaxPriceLabel(value: rangeSlider.rightValue)
    }

    @IBAction func wholeSaleSwitchChanged(_ sender: Any) {
        if let wholeSholeSwitch = sender as? UISwitch{
            filterPageDelegate?.wholeSaleChanged(value: wholeSholeSwitch.isOn)
        }
    }
    
    func updateMinPriceLabel(value : CGFloat){
        let roundedUpvalue = Int(Int(value/100)*100)
        let attributedText = NSAttributedString.init(string: "Minimum Price\n Rp \(roundedUpvalue)")
        minPriceLabel.attributedText = attributedText
        filterPageDelegate?.minPriceChanged(value: roundedUpvalue)
    }
    
    func updateMaxPriceLabel(value : CGFloat){
        let roundedUpvalue = Int(Int(value/100)*100)
        let attributedText = NSAttributedString.init(string: "Maximum Price\n Rp \(roundedUpvalue)")
        maxPriceLabel.attributedText = attributedText
        filterPageDelegate?.maxPriceChanged(value: roundedUpvalue)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
