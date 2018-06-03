//
//  ResponseHeader.swift
//  SearchFilter
//
//  Created by S@nchit on 03/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

class ResponseHeader : Codable{
    var totalData : Int
    
    public enum CodingKeys : String,CodingKey{
        case totalData = "total_data"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(totalData, forKey: .totalData)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        totalData = try container.decode(Int.self, forKey: .totalData)
    }
}
