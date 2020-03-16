//
//  Piece.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class Piece {
    var location: Location
    var isActive: Bool
    var color: String
    var moves: Int
    var imageName: String
    
    init(active: Bool, loc: Location, side: String) {
        
        //tag and location, tens digit: y location, ones digit: x location
        location = loc
        isActive = active
        moves = 0
        color = side
        imageName = ""
    }
    
    func FindAvailableSquares () -> [Location] {
        var squares = [Location(13)]
        return squares
    }
    
    func isAvailableSquare(_ tile: Tile) -> Bool {
        let squares = self.FindAvailableSquares()
        var bool = false
        for square in squares {
            if tile.location.location == square.location {
                bool = true
            }
        }
        
        return bool
    }
    func Move(newLocation: Location) {
        location = newLocation
        moves += 1
    }
}
