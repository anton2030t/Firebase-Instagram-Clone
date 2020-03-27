//
//  ContentView.swift
//  FirebaseInstagramClone
//
//  Created by Антон Ларченко on 17.03.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                Home().navigationBarTitle("Instagram")
                    .navigationBarItems(leading:
                        
                        Button(action: {
                        
                    }, label: {
                        Image(systemName: "camera").frame(width: 30, height: 30)
                    }).foregroundColor(Color("darkAndWhite"))
                        , trailing:
                        
                        HStack {
                            Button(action: {
                            
                        }, label: {
                            Image(systemName: "tv.circle").frame(width: 30, height: 30)
                                }).foregroundColor(Color("darkAndWhite"))
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "paperplane").frame(width: 30, height: 30)
                            }.foregroundColor(Color("darkAndWhite"))
                    })
                
            }.tabItem {
                Image(systemName: "house")
            }
            Text("Find").tabItem {
                Image(systemName: "magnifyingglass")
            }
            Text("Upload").tabItem {
                Image(systemName: "plus.app")
            }
            Text("Likes").tabItem {
                Image(systemName: "heart")
            }
            Text("Profile").tabItem {
                Image(systemName: "person")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
