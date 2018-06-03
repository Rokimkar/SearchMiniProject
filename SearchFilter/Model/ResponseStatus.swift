//
//  ResponseStatus.swift
//  SearchFilter
//
//  Created by S@nchit on 02/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

class ResponseStatus : Codable{
    var errorCode : Int?
    var message : String?
    
    public enum CodingKeys : String,CodingKey{
        case errorCode = "error_code"
        case message = "message"
    }
    
    func encode(to encoder : Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(errorCode, forKey: .errorCode)
        try? container.encode(message, forKey: .message)
    }
    
    required init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        errorCode = try? container.decode(Int.self, forKey: .errorCode)
        message = try? container.decode(String.self, forKey: .message)
    }
}
