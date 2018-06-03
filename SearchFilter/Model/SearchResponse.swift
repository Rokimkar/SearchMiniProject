//
//  SearchResponse.swift
//  SearchFilter
//
//  Created by S@nchit on 02/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

class SearchResponse : Codable{
    var status : ResponseStatus
    var data : [TokoProduct]
    
    public enum CodingKeys : String,CodingKey{
        case status = "status"
        case data = "data"
    }
    
    func encode (to encoder : Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(status, forKey: .status)
        try container.encode(data, forKey: .data)
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        status = try container.decode(ResponseStatus.self, forKey: .status)
        data = try container.decode([TokoProduct].self, forKey: .data)
    }
}
