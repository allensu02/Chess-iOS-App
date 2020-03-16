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
    
    override func FindAvailableSquares() -> [Location] {
        var squares: [Location] = []
        let x = self.location.getX()
        let y = self.location.getY()
        
        
        switch self.color {
        case "white":
            squares.append(Location(x: x, y: y+1))
            if moves == 0 {
                squares.append(Location(x: x, y: y+2))
            }
        case "black":
            squares.append(Location(x: x, y: y - 1))
            if moves == 0 {
                squares.append(Location(x: x, y: y - 2))
            }
        default:
            print("error with pawn find avail squares")
        }
        
        return squares
    }
}
