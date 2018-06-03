//
//  CacheRouter.swift
//  SearchFilter
//
//  Created by S@nchit on 01/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation
import Disk

class CacheRouter{
    class func writeDataToCache(for request : EndPointType,data : Data){
        if let path = request.parameters{
            do{
                let cache = Cache.init(data: data)
                try Disk.save(cache, to: .documents, as: "\(request.baseUrl)\(path)")
                
            }catch{
                //Handle error.
            }
        }
        
    }
    
    func readDataFromCache(for request : EndPointType,success : response<Data>,failure : (Error)->Void){
        if let path = request.parameters{
            do{
                let cacheData = try Disk.retrieve("\(request.baseUrl)\(path)", from: .documents, as: Cache.self)
                let now = Date()
                let timeDifference = abs(Int(cacheData.savedTime.timeIntervalSince(now))/60)
                let cacheDurationIntegerValue = Int(request.cacheTime)
                if cacheDurationIntegerValue > timeDifference{
                    failure(NSError.init(domain: "Cache expired", code: 0, userInfo: [:]))
                }else{
                    success(cacheData.data)
                }
            }catch{
                failure(error)
            }
        }else{
            failure(NSError.init(domain: "Path not found", code: 1, userInfo: [:]))
        }
    }
}
