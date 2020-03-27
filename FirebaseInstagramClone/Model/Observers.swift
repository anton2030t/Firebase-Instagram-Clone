//
//  Observers.swift
//  FirebaseInstagramClone
//
//  Created by Антон Ларченко on 17.03.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import SwiftUI
import Firebase

class Observer: ObservableObject {
    
    @Published var status = [DataType]()
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("status").addSnapshotListener { (snap, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges {
                
                if i.type == .added {
                    
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let image = i.document.get("image") as! String
                    
                    self.status.append(DataType(id: id, name: name, image: image))
                }
                
                if i.type == .removed {
                    
                    let id = i.document.documentID
                    
                    
                    for j in 0..<self.status.count {
                        
                        if self.status[j].id == id {
                            
                            self.status.remove(at: j)
                            return
                        }
                    }
                }
            }
        }
    }
}

class PostsObserver: ObservableObject {
    
    @Published var posts = [DataType1]()
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("posts").addSnapshotListener { (snap, err) in
            
            if err != nil {
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges {
                
                if i.type == .added {
                    
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let image = i.document.get("image") as! String
                    let comment = i.document.get("comments") as! String
                    let likes = i.document.get("likes") as! String
                    
                    self.posts.append(DataType1(id: id, name: name, image: image, comments: comment, likes: likes))
                }
                
                if i.type == .removed {
                    
                    let id = i.document.documentID
                    
                    
                    for j in 0..<self.posts.count {
                        
                        if self.posts[j].id == id{
                            
                            self.posts.remove(at: j)
                            return
                        }
                    }
                }
                
                if i.type == .modified {
                    
                    let id = i.document.documentID
                    let likes = i.document.get("likes") as! String
                    
                    for j in 0..<self.posts.count {
                        
                        if self.posts[j].id == id{
                            
                            self.posts[j].likes = likes
                            return
                        }
                    }
                    
                }
            }
        }
    }
}
