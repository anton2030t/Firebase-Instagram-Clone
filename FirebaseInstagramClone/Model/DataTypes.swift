//
//  DataTypes.swift
//  FirebaseInstagramClone
//
//  Created by Антон Ларченко on 17.03.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import Foundation
import SwiftUI


struct DataType1: Identifiable {
    
    var id: String
    var name: String
    var image: String
    var comments: String
    var likes: String
}


struct DataType: Identifiable {
    
    var id: String
    var name: String
    var image: String
}
