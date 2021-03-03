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
    
    var videoID: String
   
    func makeUIView(context:Context) -> WKWebView {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return WKWebView()
        }
        
        let request = URLRequest(url: youtubeURL)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
}

