//
//  Location.swift
//  Chess
//
//  Created by Allen Su on 2020/3/10.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

struct Location {
    var location: Int
    init(_ loc: Int) {
        location = loc
    }
    
    init(x: Int, y: Int) {
        location = x + y * 10
    }
    
    func getX () -> Int{
        return location%10
    }
    
    func getY () -> Int{
        return location/10
    }
    
    mutating func changeLocation(_ newLoc: Int) {
        location = newLoc
    }
    
    
}
