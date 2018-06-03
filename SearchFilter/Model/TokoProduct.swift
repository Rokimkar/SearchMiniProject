//
//  TokoProduct.swift
//  SearchFilter
//
//  Created by S@nchit on 02/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

class TokoProduct : Codable{
    var productId : Int
    var name : String?
    var url : String?
    var imageUrl : String?
    var price : String?
    
    public enum CodingKeys : String,CodingKey{
        case productId = "id"
        case name = "name"
        case url = "uri"
        case imageUrl = "image_uri"
        case price = "price"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(productId, forKey: .productId)
        try? container.encode(name, forKey: .name)
        try? container.encode(url, forKey: .url)
        try? container.encode(imageUrl, forKey: .imageUrl)
        try? container.encode(price, forKey: .price)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        productId = try container.decode(Int.self, forKey: .productId)
        name = try? container.decode(String.self, forKey: .name)
        url = try? container.decode(String.self, forKey: .url)
        imageUrl = try? container.decode(String.self, forKey: .imageUrl)
        price = try? container.decode(String.self, forKey: .price)
    }
}
