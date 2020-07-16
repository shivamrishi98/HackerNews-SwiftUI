//
//  searchBar.swift
//  HNewsSwiftUI
//
//  Created by Shivam Rishi on 16/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import Foundation
import SwiftUI

struct searchBar: UIViewRepresentable
{
    
    @Binding var text:String
    
    func makeUIView(context: UIViewRepresentableContext<searchBar>) -> UISearchBar {
        let searchbar = UISearchBar(frame: .zero)
        searchbar.delegate = context.coordinator
        searchbar.showsCancelButton = true
        searchbar.placeholder = "Search news"
        return searchbar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<searchBar>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> searchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    
    
    
    class Coordinator:NSObject, UISearchBarDelegate
    {
        @Binding var text:String
        
        init(text: Binding<String>)
        {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

            text = ""

            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = true
            searchBar.endEditing(true)
        }
        
        
        
        
        
    }
    
}
