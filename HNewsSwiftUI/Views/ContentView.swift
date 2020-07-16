//
//  ContentView.swift
//  HNewsSwiftUI
//
//  Created by Shivam Rishi on 12/07/20.
//  Copyright © 2020 shivam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var searchtext = ""
    var body: some View {
        NavigationView
            {
                
                VStack
                    {
                searchBar(text: $searchtext)
                        List(networkManager.posts.filter { self.searchtext.isEmpty ? true : $0.title.lowercased().prefix(self.searchtext.count).contains(self.searchtext.lowercased()) }) {  post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text(String(post.points))
                            Text(post.title)
                            
                        }
                    }
                    
                }
                .navigationBarTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
