//
//  FilterPageButtonProtocol.swift
//  SearchFilter
//
//  Created by S@nchit on 04/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

protocol FilterPageProtocol {
    func reset()
    func minPriceChanged(value : Int)
    func maxPriceChanged(value : Int)
    func wholeSaleChanged(value : Bool)
    func goldMerchantChanged(isSelected : Bool)
    func officialShopTypeChanged(isSelected : Bool)
}
