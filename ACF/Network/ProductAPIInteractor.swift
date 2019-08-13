//
//  ProductAPIInteractor.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import UIKit

struct ProductAPIInteractor {
    let apiService = ProductAPIService()
    
    public func getProducts(completion: @escaping ([Product]) -> Void) {
        apiService.getData(route: ProductAPIRouter.product) { (data) in
            let decoder = JSONDecoder()
            if let data = data, let results = try? decoder.decode([Product].self, from: data) {
                completion(results)
            } else {
                print("error")
            }
        }
    }
    
    public func getImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        apiService.getData(route: ProductAPIRouter.image(urlString)) { (data) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            }
        }
    }
}
