//
//  ViewController.swift
//  WebView
//
//  Created by DA MAC M1 157 on 2023/09/12.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private let webView: WKWebView = {
        
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        
        let con = WKWebViewConfiguration()
        con.defaultWebpagePreferences = prefs
        
        let webView = WKWebView(frame: .zero, configuration: con)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        setupUI()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupUI() {
       // webView.frame = view.bounds
        guard let url = URL(string: "https://thedigitalacademy.co.za/") else {
            return
        }
        webView.load(URLRequest(url: url))
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in
                guard let html = result as? String, error == nil else {
                    return
                }
                print(html)
            }
        }
        
        setupConstraints()
    }
    
    
    
    func setupConstraints() {
        
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
    }


}

