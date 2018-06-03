//
//  NetworkRouter.swift
//  SearchFilter
//
//  Created by S@nchit on 01/06/18.
//  Copyright © 2018 til. All rights reserved.
//

import Foundation
import Alamofire

typealias response<T> = (_ :T)->Void

class NetworkRouter{
    
    func fetchDataFromNetwork (for request : EndPointType,success : @escaping response<Data>,failure : @escaping (Error)->Void){
        
        Alamofire.request(getUrl(for: request), method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: request.headers).responseData { (data) in
            if let responseData = data.result.value{
                CacheRouter.writeDataToCache(for: request, data: responseData)
                success(responseData)
            }else{
                failure(NSError.init(domain: "Response failure", code: 0, userInfo: [:]))
            }
        }
    }
    
    fileprivate func getUrl(for request : EndPointType) -> String{
        return "\(request.baseUrl)\(request.parameters ?? "")"
    }
    
    fileprivate func getHTTPMethod(for request : EndPointType) -> HTTPMethod{
        var requestMethod : HTTPMethod = .get
        
        switch request.httpMethod {
        case .GET:
            requestMethod = .get
            break
        case .POST:
            requestMethod = .post
            break
        
        }
        return requestMethod
    }
    
    
    class func bindImage(for imageUrl : String,with imageView : UIImageView){
        Alamofire.request(imageUrl, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (responseData) in
            if let imageData = responseData.result.value{
                DispatchQueue.main.async {
                    imageView.image = UIImage.init(data: imageData)
                }
            }
        }
    }
}