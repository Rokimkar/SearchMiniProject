//
//  SearchDataService.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

typealias searchDataResponse = (_ data : [TokoProductViewModel],_ isLoadMoreAvailble : Bool) -> Void

class SearchDataSevice{
    
    var searchFilter = SearchFilter()
    var query : String
    var start : Int
    var row : Int
    
    init(query : String,minPrice : Int,maxPrice : Int,wholeSale : Bool,official : Bool,fshop : Int,start : Int,row : Int){
        self.query = query
        self.start = start
        self.row = row
        searchFilter.minPrice = minPrice
        searchFilter.maxPrice = maxPrice
        searchFilter.fshop = fshop
        searchFilter.wholeSale = wholeSale
        searchFilter.official = official
    }
    
    func fetchSearchResults(query : String,isLoadMore : Bool,success : @escaping searchDataResponse,failure: @escaping (Error)->Void){
        start += row
        let request = SearchRequestEndPoint.init(query: query, minPrice: searchFilter.minPrice, maxPrice: searchFilter.maxPrice, wholeSale: searchFilter.wholeSale, official: searchFilter.official, fshop: searchFilter.fshop, start:start , row: row)
        
        RouterManager.sharedInstance.fetchData(for: request, fetchType: .cache, success: { (searchData : SearchResponse) in
            var isLoadMoreAvailable = false
            if searchData.header.totalData > self.start{
                isLoadMoreAvailable = true
            }
            success(self.getTokoProductViewModels(for: searchData.data),isLoadMoreAvailable)
        }) { (error) in
            failure(error)
        }
        
    }
    
    func getTokoProductViewModels(for models : [TokoProduct]) -> [TokoProductViewModel]{
        return models.map { (model) in
            return TokoProductViewModel.init(model: model)
        }
    }
}
