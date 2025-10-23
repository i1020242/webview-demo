//
//  ViewController.swift
//  Webview-demo
//
//  Created by minhtri on 23/10/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private lazy var openWebViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open WebPage", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(openWebViewTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(openWebViewButton)
        
        NSLayoutConstraint.activate([
            openWebViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openWebViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openWebViewButton.widthAnchor.constraint(equalToConstant: 200),
            openWebViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func openWebViewTapped() {
        let webViewController = WebViewController()
        webViewController.modalPresentationStyle = .fullScreen
        present(webViewController, animated: true)
    }
}

class WebViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadWebContent()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(webView)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            // WebView constraints
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20),
            
            // Close button constraints
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func loadWebContent() {
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @objc private func closeTapped() {
        dismiss(animated: true)
    }
}

