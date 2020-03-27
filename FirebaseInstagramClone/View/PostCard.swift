//
//  PostCard.swift
//  FirebaseInstagramClone
//
//  Created by Антон Ларченко on 17.03.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct PostCard: View {
    
    var user = ""
    var image = ""
    var id = ""
    var likes = ""
    var comments = ""
    
    var body : some View{
        
        VStack(alignment: .leading, content: {
 
            HStack {
                
                AnimatedImage(url: URL(string: image)).resizable().frame(width: 30, height: 30).clipShape(Circle())
                Text(user)
                Spacer()
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "ellipsis").frame(width: 15, height: 15)
                }.foregroundColor(Color("darkAndWhite"))
            }
            
            AnimatedImage(url: URL(string: image)).resizable().frame(height: 350)
            
            HStack {
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "message").frame(width: 26, height: 26)
                }.foregroundColor(Color("darkAndWhite"))
                
                Button(action: {
                    
                    // update likes...
                    
                    let db = Firestore.firestore()
                   
                    let like = Int.init(self.likes)!
                    db.collection("posts").document(self.id).updateData(["likes": "\(like + 1)"]) { (err) in
                        
                        if err != nil{
                            
                            print((err) as Any)
                            return
                        }
                        
                        print("updated....")
                    }
                    
                }) {
                    
                    Image(systemName: "heart").frame(width: 26, height: 26)
                }.foregroundColor(Color("darkAndWhite"))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "bookmark").frame(width: 30, height: 30)
                }.foregroundColor(Color("darkAndWhite"))
                
            }.padding(.top, 8)
            
            
            Text("\(likes) Likes").padding(.top, 8)
            Text("View all \(comments) Comments")
            
         }).padding(8)
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard()
    }
}
