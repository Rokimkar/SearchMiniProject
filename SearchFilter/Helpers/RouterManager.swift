//
//  Router.swift
//  SearchFilter
//
//  Created by S@nchit on 01/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

public typealias responseData<T:Codable> = (T)->Void

public enum FetchType{
    case network
    case cache
}

class RouterManager{
    
    static let sharedInstance = RouterManager()
    
    lazy var networkRouter = NetworkRouter()
    lazy var cacheRouter = CacheRouter()
    
    func fetchData<T:Codable>(for request : EndPointType,fetchType : FetchType,success:@escaping responseData<T>,failure : @escaping (Error) -> Void){
        switch fetchType {
        case .network:
            networkRouter.fetchDataFromNetwork(for: request, success: { (responseData) in
                JsonSerialiser.serialiseData(data: responseData, success: { (serialisedItem : T?) in
                    if let _ = serialisedItem{
                        success(serialisedItem!)
                    }else{
                        failure(NSError.init(domain: "Item is nil while serialising", code: 0, userInfo: ["source":"network"]))
                    }
                }, failure: { (error) in
                    failure(error)
                })
            }) { (error) in
                failure(error)
            }
            break
        case .cache:
            cacheRouter.readDataFromCache(for: request, success: { (responseData) in
                JsonSerialiser.serialiseData(data: responseData, success: { (serialisedItem : T?) in
                    if let _ = serialisedItem{
                        success(serialisedItem!)
                    }else{
                        failure(NSError.init(domain: "Item is nil while serialising", code: 0, userInfo: ["source":"cache"]))
                    }
                }, failure: { (error) in
                    failure(error)
                })
            }) { (error) in
                self.fetchData(for: request, fetchType: .network, success: { (networkData : T) in
                    success(networkData)
                }, failure: { (error) in
                    failure(error)
                })
            }
            break
        }
    }
}
