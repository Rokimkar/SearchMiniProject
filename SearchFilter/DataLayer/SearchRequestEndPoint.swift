//
//  SearchRequestEndPoint.swift
//  SearchFilter
//
//  Created by S@nchit on 31/05/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

class SearchRequestEndPoint: EndPointType {
    
    var headers : [String : String]?{
        return nil
    }
    
    
    var baseUrl: String{
        return "https://ace.tokopedia.com/search/v2.5/product"
    }
    
    var parameters: String? {
        get{
            return params
        }
    }
    
    var httpMethod: RequestMethod{
        return .GET
    }
    
    var cacheTime: TimeInterval{
        return 10*60 // 10 mins
    }
    
    fileprivate var params : String
    
    init(query : String,minPrice : Int,maxPrice : Int,wholeSale : Bool,official : Bool,fshop : Int,start : Int,row : Int) {
        params = "?q=\(query)&pmin=\(minPrice)&pmax=\(maxPrice)&wholesale=\(wholeSale)&official=\(official)&fshop=\(fshop)&start=\(start)&row=\(row)"
    }
}
