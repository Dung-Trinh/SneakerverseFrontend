//
//  WebView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 03.03.21.
//

import SwiftUI
import WebKit
import Foundation

struct WebView: UIViewRepresentable {
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
    
    var url: String
   
    func makeUIView(context:Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
}

