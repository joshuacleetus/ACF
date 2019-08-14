//
//  HomeViewController.swift
//  ACF
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    lazy var dataSource: ProductDataSource = { [weak self] in
        let dataSource = ProductDataSource()
        dataSource.onShopButtonPressed = self?.onShopButtonPressed
        return dataSource
        }()
    
    lazy var viewModel: ProductViewModel = {
        let viewModel = ProductViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    private lazy var onShopButtonPressed: (String?) -> Void = { [weak self] target in
        let detailVC = DetailViewController()
        detailVC.targetURLString = target
        self?.navigationController?.pushViewController(detailVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        dataSource.data.addAndNotify(observer: self, completionHandler: {[weak self] result in
            self?.tableView.reloadData()
        })
        viewModel.getProducts()
    }


}
