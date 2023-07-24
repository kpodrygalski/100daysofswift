//
//  DetailViewController.swift
//  ProjectNine
//
//  Created by Konrad Podrygalski on 24/07/2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?

    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadHTMLContent()
    }
    
    private func loadHTMLContent() {
        guard let detailItem = detailItem else { return }
        
        let html = """
            <html>
            <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style> body { font-size: 150%; } </style>
            </head>
            <body>
            <h4 style="color:blue;">\(detailItem.title)</h4>
            <hr />
            <p><i>\(detailItem.body)</i></p>
            </body>
            </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}
