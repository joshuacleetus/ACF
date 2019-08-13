//
//  ProductAPIRouter.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import Foundation
import Alamofire

enum ProductAPIRouter: URLRequestConvertible {
    
    case product
    case image(String)
    
    var baseURL: String {
        switch self {
        case .product:
            return "https://www.abercrombie.com"
        case .image(let urlString):
            return urlString
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .product, .image:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .product:
            return "/anf/nativeapp/qa/codetest/codeTest_exploreData.json"
        case .image:
            return ""
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .product, .image:
            return [:]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
