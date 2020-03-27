//
//  Home.swift
//  FirebaseInstagramClone
//
//  Created by Антон Ларченко on 17.03.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct Home: View {
    
    @ObservedObject var observed = Observer()
    @ObservedObject var postsobserver = PostsObserver()
    @State var show = false
    @State var user = ""
    @State var url = ""
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(observed.status) { i in
                            
                            StatusCard(imName: i.image, user: i.name, show: self.$show, user1: self.$user, url: self.$url).padding(.leading, 10)
                        }
                        
                    }.animation(.spring())
                }
                
                if postsobserver.posts.isEmpty {
                    
                    Text("No Posts").fontWeight(.heavy)
                } else {
                    
                    ForEach(postsobserver.posts) { i in
                        
                        PostCard(user: i.name, image: i.image, id: i.id, likes: i.likes, comments: i.comments)
                    }
                }

            }
            
        }.sheet(isPresented: $show) {
            
            StatusView(url: self.url,name: self.user)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
