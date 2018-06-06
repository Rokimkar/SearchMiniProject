//
//  SearchFilterProtocol.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

struct DefaultValues{
    var minPrice = 100
    var maxPrice = 100000
    var wholeSale = true
    var official = true
    var fshop = 2
}

protocol SearchFilterProtocol {
    var defaultValues : DefaultValues {get set}
    var minPrice : Int {get set}
    var maxPrice : Int {get set}
    var wholeSale : Bool {get set}
    var official : Bool {get set}
    var fshop : Int {get set}
}

extension SearchFilterProtocol{
    var minPrice : Int{
        get{
            return defaultValues.minPrice
        }
        set{
            defaultValues.minPrice = newValue
        }
    }
    
    var maxPrice : Int{
        get{
            return defaultValues.maxPrice
        }
        set{
            defaultValues.maxPrice = newValue
        }
    }
    
    var wholeSale : Bool{
        get{
            return defaultValues.wholeSale
        }
        set{
            defaultValues.wholeSale = newValue
        }
    }
    
    var official : Bool{
        get{
            return defaultValues.official
        }
        set{
            defaultValues.official = newValue
        }
    }
    
    var fshop : Int{
        get{
            return defaultValues.fshop
        }
        set{
            defaultValues.fshop = newValue
        }
    }
}
