//
//  Queen.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class Queen: Piece {
    var squares: [Tile] = []

    override var imageName: String {
        get {
            return "\(color)Queen"
        } set {
        }
        
    }
    
    override var type: String {
        get {
            return "Queen"
        } set {
        }
    }
    override func FindAvailableSquares() -> [Tile] {
        
        
        //bishop squares
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
        
        //rook squares
        continueSquares = true
        newX = x
        newY = y
        
        //find squares to the left of rook
        while newX > 1  && continueSquares {
            newX -= 1
            
            let tile = Tile(x: newX, y: newY)
            
            if !toContinue(tile: tile) {
                continueSquares = false
            }
        }
        newX = x
        newY = y
        continueSquares = true
        //finding squares to the right of the rook
        while newX < 8 && continueSquares{
            newX += 1
            let tile = Tile(x: newX, y: newY)
            if !toContinue(tile: tile) {
                continueSquares = false
            }
        }
        newX = x
        newY = y
        continueSquares = true

        //finding squares to top of the rook
        while newY < 8  && continueSquares{
            newY += 1
            let tile = Tile(x: newX, y: newY)
            if !toContinue(tile: tile) {
                continueSquares = false
            }
        }
        newX = x
        newY = y
        continueSquares = true

        //squares to bottom of the rook
        while newY > 1  && continueSquares{
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
