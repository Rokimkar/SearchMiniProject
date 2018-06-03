//
//  JsonSerialiser.swift
//  SearchFilter
//
//  Created by S@nchit on 01/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

class JsonSerialiser{
    class func serialiseData <T:Codable> (data : Data,success : (T?) -> Void,failure : (Error) -> Void){
        do {
            let decoder = JSONDecoder()
            let mappedData = try decoder.decode(T.self, from: data)
            success(mappedData)
        }catch{
            failure(NSError.init(domain: "serialisation error", code: 0, userInfo: nil))
        }
    }
}
