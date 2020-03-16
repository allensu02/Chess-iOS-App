//
//  Queen.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class Queen: Piece {

    override var imageName: String {
        get {
            return "\(color)Queen"
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
        var newX = x
        var newY = y
        
        //finding squares to bottom left corner
        while newX > 1 && newY > 1 {
            newX = x - 1
            newY = y - 1
            squares.append(Location(x: newX, y: newY))
        }
        
        //finding squares to top right corner
        while newX < 8 && newY < 8 {
            newX = x + 1
            newY = y + 1
            squares.append(Location(x: newX, y: newY))
        }

        //finding squares to top left corner
        while newX > 1 && newY < 8 {
            newX = x - 1
            newY = y + 1
            squares.append(Location(x: newX, y: newY))
        }

        
        //squares to bottom right corner
        while newX < 8 && newY > 1 {
            newX = x + 1
            newY = y - 1
            squares.append(Location(x: newX, y: newY))
        }
        
        return squares
    }
}
