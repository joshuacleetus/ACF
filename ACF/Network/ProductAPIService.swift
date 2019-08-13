//
//  ProductAPIService.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import Foundation
import Alamofire

struct ProductAPIService {
    func getData(route: URLRequestConvertible, completion: @escaping ((Data?) -> Void)) {
        let urlCache = URLCache.shared
        if let route = route as? ProductAPIRouter, let request = try? route.asURLRequest(), let data = urlCache.cachedResponse(for: request )?.data {
            DispatchQueue.main.async {
                completion(data)
            }
        } else {
            Alamofire.request(route).responseJSON { (response) in
                DispatchQueue.main.async {
                    guard let urlResponse = response.response, let urlRequest = response.request, let data = response.data else { return }
                    let cachedData = CachedURLResponse(response: urlResponse, data: data)
                    urlCache.storeCachedResponse(cachedData, for: urlRequest)
                    completion(data)
                }
            }
        }
    }
}
