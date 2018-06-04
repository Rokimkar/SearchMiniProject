//
//  FilterPageButtonProtocol.swift
//  SearchFilter
//
//  Created by S@nchit on 04/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

public enum ShopType{
    case goldMerchant
    case official
    case both
}

protocol FilterPageProtocol {
    func reset()
    func minPriceChanged(value : Int)
    func maxPriceChanged(value : Int)
    func wholeSaleChanged(value : Bool)
    func shopTypeChanged(type : ShopType)
}
