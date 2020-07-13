//
//  DetailView.swift
//  HNewsSwiftUI
//
//  Created by Shivam Rishi on 13/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI
import WebKit


struct DetailView: View {
    let url:String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com")
    }
}


struct WebView: UIViewRepresentable
{
    
    let urlString:String?
    
    func makeUIView(context:Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        if let safeString = urlString
        {
            if let url = URL(string: safeString)
            {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
    
}
