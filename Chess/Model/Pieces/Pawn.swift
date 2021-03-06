//
//  Pawn.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class Pawn: Piece {
    
    override var imageName: String {
           get {
               return "\(color)Pawn"
           } set {
           }
       }
    override var type: String {
        get {
            return "Pawn"
        } set {
        }
    }
    override func FindAvailableSquares() -> [Tile] {
        var squares: [Tile] = []
        
        switch self.color {
        case "white":
            let tile = Tile(x: x, y: y+1)
            if !checkSquare(tile: tile) {
                squares.append(tile)
            }
            if moves == 0 {
                let tile = Tile(x: x, y: y+2)
                if !checkSquare(tile: tile) &&  !K.tilesArray[tile.getIndex()-8].doesHavePiece(){
                    squares.append(tile)
                }
            }
            
            if y == 5 {
                if self.x > 1 {
                    let tileOne = Tile(x: x + 1, y: y)
                    if checkSquare(tile: tileOne) {
                        if tileOne.piece?.imageName == "blackPawn" {
                            print("yes")
                        }
                    }
                }
                if self.x < 8 {
                    let tileTwo = Tile(x: x - 1, y: y)
                    if checkSquare(tile: tileTwo) {
                        if tileTwo.piece?.imageName == "blackPawn" {
                            
                        }
                    }
                }
            }
            
            
            
            if y < 8 {
                let diagonalY = y + 1
                if x > 1 {
                    let diagonalTileOneX = x - 1
                    let diagonalOneLoc = diagonalTileOneX + diagonalY * 10
                    let diagonalOne = Tile(diagonalOneLoc)
                    let indexOne = diagonalOne.getIndex()
                    if K.tilesArray[indexOne].doesHavePiece() {
                        if K.tilesArray[indexOne].piece?.color == K.black {
                            squares.append(diagonalOne)
                        }
                    }
                    
                }
                if x < 8 {
                    let diagonalTileTwoX = x + 1
                    let diagonalTwoLoc = diagonalTileTwoX + diagonalY * 10
                    let diagonalTwo = Tile(diagonalTwoLoc)
                    let indexTwo = diagonalTwo.getIndex()
                    if K.tilesArray[indexTwo].doesHavePiece() {
                        if K.tilesArray[indexTwo].piece?.color == K.black {
                            squares.append(diagonalTwo)
                        }
                    }
                    
                }
            
            }
            
            
            
        case "black":
            let tile = Tile(x: x, y: y-1)
            if !checkSquare(tile: tile) {
                squares.append(tile)
            }
            
            if moves == 0 {
                let tile = Tile(x: x, y: y-2)
                if !checkSquare(tile: tile) &&  !K.tilesArray[tile.getIndex()+8].doesHavePiece(){
                    squares.append(tile)
                }
            }
            
            if y > 1 {
                let diagonalY = y - 1
                if x > 1 {
                    let diagonalTileOneX = x - 1
                    let diagonalOneLoc = diagonalTileOneX + diagonalY * 10
                    let diagonalOne = Tile(diagonalOneLoc)
                    let indexOne = diagonalOne.getIndex()
                    if K.tilesArray[indexOne].doesHavePiece() {
                        if K.tilesArray[indexOne].piece?.color == K.white {
                            squares.append(diagonalOne)
                        }
                    }
                    
                }
                if x < 8 {
                    let diagonalTileTwoX = x + 1
                    let diagonalTwoLoc = diagonalTileTwoX + diagonalY * 10
                    let diagonalTwo = Tile(diagonalTwoLoc)
                    let indexTwo = diagonalTwo.getIndex()
                    if K.tilesArray[indexTwo].doesHavePiece() {
                        if K.tilesArray[indexTwo].piece?.color == K.white {
                            squares.append(diagonalTwo)
                        }
                    }
                    
                }
            
            }
        default:
            print("error with pawn find avail squares")
        }
        
        return squares
    }
    
    
}
