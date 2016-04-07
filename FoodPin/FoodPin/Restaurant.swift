//
//  Restaurant.swift
//  FoodPin
//
//  Created by King Luo on 3/27/16.
//  Copyright © 2016 King Luo. All rights reserved.
//

import Foundation

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isVisited: Bool
    var rating: String = ""
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}

