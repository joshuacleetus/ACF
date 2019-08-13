//
//  ProductDataSource.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import UIKit

class ProductDataSource: GenericDataSource<Product>, UITableViewDataSource {
    
    var onShopButtonPressed: ((String?) -> Void)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        cell.selectionStyle = .none
        cell.product = data.value[indexPath.row]
        cell.onShopButtonPressed = onShopButtonPressed
        return cell
    }
    
}
