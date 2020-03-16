//
//  Knight.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation
class Knight: Piece {
    
    override var imageName: String {
           get {
               return "\(color)Knight"
           } set {
        }
    }
    
    override func FindAvailableSquares() -> [Location] {
        var squares: [Location] = []
        let x = location.getX()
        let y = location.getY()
        
        var newX = 0
        var newY = 0
        var availableSquare: Location
       
        for i in 1...8 {
            
            switch i {
            case 1:
                newX = x + 1
                newY = y + 2
            case 2:
                newX = x + 1
                newY = y - 2
            case 3:
                newX = x - 1
                newY = y + 2
            case 4:
                newX = x - 1
                newY = y - 2
            case 5:
                newX = x + 2
                newY = y + 1
            case 6:
                newX = x + 2
                newY = y - 1
            case 7:
                newX = x - 2
                newY = y + 1
            case 8:
                newX = x - 2
                newY = y - 1
            default:
                print("error with Knight.findAvailableSquare")
            }
            if newX > 0 && newX < 9 && newY > 0 && newY < 9{
                availableSquare = Location(newX + newY * 10)
                squares.append(availableSquare)
            }
            
        }
        
        return squares
    }
}
