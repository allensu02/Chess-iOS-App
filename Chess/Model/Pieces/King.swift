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
    override var type: String {
        get {
            return "King"
        } set {
        }
    }
    override func FindAvailableSquares() -> [Tile] {
        var squares: [Tile] = []
        
        
        if x > 1 {
            let tile = Tile(x: x - 1, y: y)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
            
        }
        if x > 1 && y > 1 {
            let tile = Tile(x: x - 1, y: y - 1)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
        }
        if x > 1 && y < 8 {
            let tile = Tile(x: x - 1, y: y + 1)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
        }
        if x < 8 {
            let tile = Tile(x: x + 1, y: y)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
        }
        if x < 8 && y > 1 {
            let tile = Tile(x: x + 1, y: y - 1)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
        }
        if x < 8 && y < 8 {
            let tile = Tile(x: x + 1, y: y + 1)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
        }
        if y < 8 {
            let tile = Tile(x: x, y: y + 1)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
        }
        if y > 1 {
            let tile = Tile(x: x, y: y - 1)
            if checkForAttack(tile: tile) {
                squares.append(tile)
            }
        }
        
        return squares
    }
    
    func checkForAttack (tile: Tile) -> Bool {
        var availSquare: Bool = true
        if checkSquare(tile: tile) {
            if K.tilesArray[tile.getIndex()].piece?.color == self.color {
                availSquare = false
            }
        }
//        if color == K.white {
//            outerLoop: for piece in K.blackPieces {
//                if piece.isAvailableSquare(tile) {
//                    availSquare = false
//                    break outerLoop
//
//                }
//            }
//        } else {
//            outerLoop: for piece in K.whitePieces {
//                if piece.isAvailableSquare(tile) {
//                    availSquare = false
//                    break outerLoop
//                }
//            }
//        }
        
        return availSquare
    }
}
