//
//  StatusView.swift
//  FirebaseInstagramClone
//
//  Created by Антон Ларченко on 17.03.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct StatusView: View {
    
    var url = ""
    var name = ""
    
    var body: some View {
        
        ZStack {
            
            AnimatedImage(url: URL(string: url)).resizable()
            
            VStack {
                
                HStack {
                    
                    Text(name).font(.headline).fontWeight(.heavy).padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
