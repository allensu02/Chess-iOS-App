//
//  Rook.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation
class Rook: Piece {
   
    override var imageName: String {
           get {
               return "\(color)Rook"
           } set {
           }
       }
    
    override func FindAvailableSquares() -> [Tile] {
        var squares: [Tile] = []
        
       
        
        for i in 1...8 {
            //tag and location, tens digit: y location, ones digit: x location
            let horizontalSquare = Tile(i + y * 10)
            
            if horizontalSquare.x != x{
                squares.append(horizontalSquare)
            }
            let verticalSquare = Tile(x + 10 * i)
            if verticalSquare.y != y {
                squares.append(verticalSquare)
            }
        }
        
        return(squares)
        
    }
}
