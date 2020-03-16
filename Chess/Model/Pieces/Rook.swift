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
    
    override func FindAvailableSquares() -> [Location] {
        var squares: [Location] = []
        
        let x = location.getX()
        let y = location.getY()
        
        for i in 1...8 {
            //tag and location, tens digit: y location, ones digit: x location
            let horizontalSquare = Location(i + y * 10)
            if horizontalSquare.getX() != x{
                squares.append(horizontalSquare)
            }
            let verticalSquare = Location(x + 10 * i)
            if verticalSquare.getY() != y {
                squares.append(verticalSquare)
            }
        }
        
        return(squares)
        
    }
}
