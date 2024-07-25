//
//  ContentView.swift
//  News
//
//  Created by Helena on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    
    //Subscribe every changes in network manager
    @ObservedObject var networkmanager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkmanager.posts, rowContent: { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            })
            .navigationTitle("Your Update News")
        }
        .onAppear(perform: {
            self.networkmanager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}

