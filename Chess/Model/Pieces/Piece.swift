//
//  Piece.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class Piece {
    var location: Int
    var x: Int
    var y: Int
    var isActive: Bool
    var color: String
    var moves: Int
    var imageName: String
    var opponentColor: String
    var type: String
    init(active: Bool, loc: Int, side: String) {
        
        //tag and location, tens digit: y location, ones digit: x location
        location = loc
        x = loc%10
        y = loc/10
        isActive = active
        moves = 0
        color = side
        imageName = ""
        if color == K.white {
            opponentColor = K.black
        } else {
            opponentColor = K.white
        }
        type = ""
    }
    
    func FindAvailableSquares () -> [Tile] {
        return [Tile()]
        
    }
    
    
    
    func isAvailableSquare(_ tile: Tile) -> Bool {
        let squares = self.FindAvailableSquares()
        var bool = false
        outerLoop: for square in squares {
            if tile.tag == square.tag{
                bool = true
                break outerLoop
            }
        }
        
        return bool
    }
    func Move(newLocation: Int) {
        location = newLocation
        x = newLocation%10
        y = newLocation/10
        moves += 1
    }
    
    func checkSquare (tile: Tile) -> Bool {
        return K.tilesArray[tile.getIndex()].doesHavePiece()
    }
}
