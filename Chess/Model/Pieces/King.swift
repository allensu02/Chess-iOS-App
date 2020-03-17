//
//  King.swift
//  Chess
//
//  Created by Allen Su on 2020/3/11.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation
class King: Piece {
    
    override var imageName: String {
           get {
               return "\(color)King"
           } set {
           }
       }
    
    override func FindAvailableSquares() -> [Tile] {
        var squares: [Tile] = []
     
        
        if x > 1 {
            squares.append(Tile(x: x - 1, y: y))
        }
        if x > 1 && y > 1 {
            squares.append(Tile(x: x - 1, y: y - 1))
        }
        if x > 1 && y < 8 {
            squares.append(Tile(x: x - 1, y: y + 1))
        }
        if x < 8 {
            squares.append(Tile(x: x + 1, y: y))
        }
        if x < 8 && y > 1 {
            squares.append(Tile(x: x + 1, y: y - 1))
        }
        if x < 8 && y < 8 {
            squares.append(Tile(x: x + 1, y: y + 1))
        }
        if y < 8 {
            squares.append(Tile(x: x, y: y + 1))
        }
        if y > 1 {
            squares.append(Tile(x: x, y: y - 1))
        }
        
        return squares
    }
}
