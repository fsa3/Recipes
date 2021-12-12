//
//  WebpageView.swift
//  Recipes
//
//  Created by Fannar Steinn Aðalsteinsson on 10.12.2021.
//

import SwiftUI
import WebKit

struct WebpageView: UIViewRepresentable {
    typealias UiViewType = WKWebView
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
