//
//  SearchDataService.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

typealias searchDataResponse = (_ data : [TokoProduct],_ isLoadMoreAvailble : Bool) -> Void

class SearchDataSevice{
    
    var query : String
    var minPrice : Int
    var maxPrice : Int
    var wholeSale : Bool
    var official : Bool
    var fshop : Int
    var start : Int
    var row : Int
    
    init(query : String,minPrice : Int,maxPrice : Int,wholeSale : Bool,official : Bool,fshop : Int,start : Int,row : Int){
        self.query = query
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.wholeSale = wholeSale
        self.official = official
        self.fshop = fshop
        self.start = start
        self.row = row
    }
    
    func fetchSearchResults(query : String,isLoadMore : Bool,success : @escaping searchDataResponse,failure: @escaping (Error)->Void){
        start += row
        let request = SearchRequestEndPoint.init(query: query, minPrice: minPrice, maxPrice: maxPrice, wholeSale: wholeSale, official: official, fshop: fshop, start:start , row: row)
        
        RouterManager.sharedInstance.fetchData(for: request, fetchType: .cache, success: { (searchData : SearchResponse) in
            var isLoadMoreAvailable = false
            if searchData.header.totalData > self.start{
                isLoadMoreAvailable = true
            }
            success(searchData.data,isLoadMoreAvailable)
        }) { (error) in
            failure(error)
        }
        
    }
}
