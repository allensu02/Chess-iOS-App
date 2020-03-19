//
//  Bishop.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation
class Bishop: Piece {
    override var imageName: String {
           get {
               return "\(color)Bishop"
           } set {
        }
    }
    
    
    override func FindAvailableSquares() -> [Tile] {
        var squares: [Tile] = []
     
        
        var newX = x
        var newY = y
        
        //finding squares to bottom left corner
        while newX > 1 && newY > 1 {
            newX -= 1
            newY -= 1
            
            squares.append(Tile(x: newX, y: newY))
        }
        newX = x
        newY = y
        //finding squares to top right corner
        while newX < 8 && newY < 8 {
            newX += 1
            newY += 1
            squares.append(Tile(x: newX, y: newY))
        }
        newX = x
        newY = y
        //finding squares to top left corner
        while newX > 1 && newY < 8 {
            newX -= 1
            newY += 1
            squares.append(Tile(x: newX, y: newY))
        }
        newX = x
        newY = y
        //squares to bottom right corner
        while newX < 8 && newY > 1 {
            newX += 1
            newY -= 1
            
        }
        
        return squares
    }
}
