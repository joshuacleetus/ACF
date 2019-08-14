//
//  ProductAPIProtocol.swift
//  ACF
//
//  Created by Macbook Air on 8/13/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import Foundation
import Alamofire

protocol ProductAPIProtocol {
    func getData(route: URLRequestConvertible, completion: @escaping ((Data?) -> Void))
}
