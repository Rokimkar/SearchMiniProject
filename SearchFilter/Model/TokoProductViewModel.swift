//
//  TokoProductViewModel.swift
//  SearchFilter
//
//  Created by S@nchit on 06/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation

struct TokoProductViewModel{
    var productId : Int
    var name : String
    var url : String
    var imageUrl : String
    var price : String
    
    init(model : TokoProduct){
        productId = model.productId
        name = model.name ?? ""
        url = model.url ?? ""
        imageUrl = model.imageUrl ?? ""
        price = model.price ?? ""
    }
}
