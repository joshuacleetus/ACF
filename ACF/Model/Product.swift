//
//  Product.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import Foundation

struct Product: Codable {
    let title: String?
    let backgroundImage: String?
    let content: [Content]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
}

struct Content: Codable {
    let target: String?
    let title: String?
}
