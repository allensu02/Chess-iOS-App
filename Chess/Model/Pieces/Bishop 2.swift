//
//  Bishop.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation
class Bishop: Piece {
    var squares: [Tile] = []

    override var imageName: String {
           get {
               return "\(color)Bishop"
           } set {
        }
    }
    override var type: String {
        get {
            return "Bishop"
        } set {
        }
    }
    
    override func FindAvailableSquares() -> [Tile] {
     
        
        var newX = x
        var newY = y
        
        //finding squares to bottom left corner
        var continueSquares = true

        while newX > 1 && newY > 1 && continueSquares {
            newX -= 1
            newY -= 1
            
            let tile = Tile(x: newX, y: newY)
            
            if !toContinue(tile: tile) {
                continueSquares = false
            }
        }
        newX = x
        newY = y
        continueSquares = true
        //finding squares to top right corner
        while newX < 8 && newY < 8  && continueSquares{
            newX += 1
            newY += 1
            let tile = Tile(x: newX, y: newY)
            if !toContinue(tile: tile) {
                continueSquares = false
            }
        }
        newX = x
        newY = y
        continueSquares = true

        //finding squares to top left corner
        while newX > 1 && newY < 8  && continueSquares{
            newX -= 1
            newY += 1
            let tile = Tile(x: newX, y: newY)
            if !toContinue(tile: tile) {
                continueSquares = false
            }
        }
        newX = x
        newY = y
        continueSquares = true

        //squares to bottom right corner
        while newX < 8 && newY > 1  && continueSquares{
            newX += 1
            newY -= 1
            let tile = Tile(x:newX, y:newY)
            if !toContinue(tile: tile) {
                continueSquares = false
            }
        }
        
        return squares
    }
    
    
    func toContinue (tile: Tile) -> Bool {
        var continueSquares = true
        if checkSquare(tile: tile) {
            if K.tilesArray[tile.getIndex()].piece?.color == self.color {
                continueSquares = false
            } else {
                squares.append(tile)
                continueSquares = false
            }
        } else {
            squares.append(tile)
        }
        return continueSquares
        
    }
}
