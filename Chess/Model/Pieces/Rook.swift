//
//  Rook.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation
class Rook: Piece {
   
    var squares: [Tile] = []

    override var imageName: String {
           get {
               return "\(color)Rook"
           } set {
           }
       }
    
    override var type: String {
        get {
            return "Rook"
        } set {
        }
    }
    override func FindAvailableSquares() -> [Tile] {

        var continueSquares = true
        var newX = x
        var newY = y
        

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
        //finding squares to top right corner
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

        //finding squares to top left corner
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

        //squares to bottom right corner
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
