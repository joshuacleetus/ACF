//
//  PorductViewModel.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import Foundation

struct ProductViewModel {
    
    weak var dataSource: GenericDataSource<Product>?
    let apiInteractor = ProductAPIInteractor()
    
    init(dataSource: GenericDataSource<Product>?) {
        self.dataSource = dataSource
    }
    
    func getProducts() {
        apiInteractor.getProducts { (result) in
            self.dataSource?.data.value = result
        }
    }
    
}
