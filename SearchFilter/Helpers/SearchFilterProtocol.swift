//
//  SearchFilterProtocol.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

protocol SearchFilterProtocol {
    var minPrice : Int {get set}
    var maxPrice : Int {get set}
    var wholeSale : Bool {get set}
    var official : Bool {get set}
    var fshop : Int {get set}
}

extension SearchFilterProtocol{
    var minPrice : Int{
        get{
            return 1000
        }
        set{
            
        }
    }
    
    var maxPrice : Int{
        get{
            return 10000
        }
        set{
            
        }
    }
    
    var wholeSale : Bool{
        get{
            return true
        }
        set{
            
        }
    }
    
    var official : Bool{
        get{
            return true
        }
        set{
            
        }
    }
    
    var fshop : Int{
        get{
            return 2
        }
        set{
            
        }
    }
}
