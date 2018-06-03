//
//  Cache.swift
//  SearchFilter
//
//  Created by S@nchit on 01/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

class Cache : Codable{
    var data : Data
    var savedTime = Date.init()
    
    init(data : Data){
        self.data = data
    }
    
    private enum CodingKeys : String,CodingKey{
        case data = "cacheData"
        case savedTime = "savedTime"
    }
    
    public func encoder (to encode : Encoder) throws{
        var container = encode.container(keyedBy: CodingKeys.self)
        
        try container.encode(data, forKey: CodingKeys.data)
        try container.encode(savedTime, forKey: .savedTime)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        data = try container.decode(Data.self, forKey: .data)
        savedTime = try container.decode(Date.self, forKey: .savedTime)
    }
}
