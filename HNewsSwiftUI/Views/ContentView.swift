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
    
    var body: some View {
        NavigationView
            {
                List(networkManager.posts)
                {  post in
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
