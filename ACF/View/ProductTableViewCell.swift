//
//  ProductTableViewCell.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import UIKit
import WebKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentTable: UITableView!
    @IBOutlet public var bgImage: UIImageView!
    @IBOutlet public var topDescription: UILabel!
    @IBOutlet public var title: UILabel!
    @IBOutlet public var promoMessage: UILabel!
    @IBOutlet public var bottomDescription: UILabel!
    @IBOutlet weak var bgImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var button1HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var button2HeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var button1: UIButton!
    var contents = [Content]()
    
    @IBOutlet weak var button2: UIButton!
    var product: Product? {
        didSet {
            self.didUpdateView()
        }
    }
    
    var onShopButtonPressed: ((String?) -> Void)?
    
    @IBAction func button1Pressed(_ sender: Any) {
        guard let content = contents.first else {return}
        onShopButtonPressed?(content.target)
    }
    
    @IBAction func button2Pressed(_ sender: Any) {
        guard contents.count > 1 else {return}
        let content = contents[1]
        onShopButtonPressed?(content.target)
    }
    
    private func didUpdateView() {
        guard let product = product else { return }
        if let urlString = product.backgroundImage {
            let apiInteractor = ProductAPIInteractor()
            apiInteractor.getImage(urlString: urlString) { [weak self] (image) in
                guard let self = self else { return }
                if self.bgImage.frame.size.width < (image.size.width) {
                    self.bgImageHeightConstraint.constant = self.bgImage.frame.size.width / (image.size.width) * (image.size.height)
                }
                self.bgImage.image = image
                self.contentView.layoutSubviews()
            }
        }
        topDescription.text = product.topDescription
        title.text = product.title
        promoMessage.text = product.promoMessage
        bottomDescription.setAttributedHtmlText(product.bottomDescription ?? "")
        bottomDescription.textAlignment = .center
        contents = product.content ?? []
        if !contents.isEmpty {
            if let firstContent = contents.first {
                button1.setTitle( firstContent.title, for: .normal)
                self.button1HeightConstraint.constant = 40
            }
            if contents.count > 1 {
                let content = contents[1]
                button2.setTitle( content.title, for: .normal)
                self.button2HeightConstraint.constant = 40
            } else {
                button2.setTitle( "", for: .normal)
                self.button2HeightConstraint.constant = 0
            }
        } else {
            button1.setTitle( "", for: .normal)
            button2.setTitle( "", for: .normal)
            self.button1HeightConstraint.constant = 0
            self.button2HeightConstraint.constant = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
