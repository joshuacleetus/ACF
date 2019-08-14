//
//  DetailViewController.swift
//  ACF
//
//  Created by Macbook Air on 8/13/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKUIDelegate {

    @IBOutlet var webView: WKWebView!
    
    var targetURLString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWebView()
    }
    
    func loadWebView() {
        guard let urlString = targetURLString else { return }
        guard let targetURL = URL(string: urlString) else { return }
        let request = URLRequest(url: targetURL)
        webView.load(request)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

}
