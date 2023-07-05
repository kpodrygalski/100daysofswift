//
//  WebsiteViewController.swift
//  ProjectFour
//
//  Created by Konrad Podrygalski on 05/07/2023.
//

import UIKit
import WebKit


class WebsiteViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var selectedWebsite: String!
    var allowedWebsites: [String]!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIBarButtons()
        setupWebView()
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host() {
            if host.contains(selectedWebsite) {
                decisionHandler(.allow)
                return
            }
        }
        
        decisionHandler(.cancel)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    private func setupUIBarButtons() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                     target: self,
                                     action: nil)
        
        let openButton = UIBarButtonItem(title: "Open",
                                         style: .plain,
                                         target: self,
                                         action: #selector(openTapped))
        
        let goForwardButton = UIBarButtonItem(title: "Next",
                                              style: .plain,
                                              target: webView,
                                              action: #selector(webView.goForward))
        
        let goBackButton = UIBarButtonItem(title: "Back",
                                           style: .plain,
                                           target: webView,
                                           action: #selector(webView.goBack))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh,
                                      target: webView,
                                      action: #selector(webView.reload))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressButton, spacer, openButton, goBackButton, goForwardButton, refresh]
        navigationController?.isToolbarHidden = false
    }
    
    private func setupWebView() {
        let url = URL(string: "https://" + selectedWebsite)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new,
                            context: nil)
    }
    
    private func openPage(action: UIAlertAction) {
        guard
            let actionTitle = action.title,
            let url = URL(string: "https://" + actionTitle)
        else { return }
        
        if !allowedWebsites.contains(actionTitle) {
            let errorAlertController = UIAlertController(title: "Error", message: "The page you are trying to visit is not allowed here.", preferredStyle: .alert)
            errorAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(errorAlertController, animated: true)
        }
        
        webView.load(URLRequest(url: url))
    }
    
    @objc private func openTapped() {
        let alertController = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        present(alertController, animated: true)
    }
}
