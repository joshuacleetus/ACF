//
//  UIlabel+Extension.swift
//  ACF
//
//  Created by Macbook Air on 8/13/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import UIKit

extension UILabel {
    func setAttributedHtmlText(_ html: String) {
        if let attributedText = html.attributedHtmlString {
            self.attributedText = attributedText
        }
    }
}
