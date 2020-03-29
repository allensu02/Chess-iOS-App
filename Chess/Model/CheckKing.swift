//
//  CheckKing.swift
//  Chess
//
//  Created by Allen Su on 2020/3/23.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CheckKing {
    func kingInCheck (color: String) -> Bool {
        var inCheck = false
        var kingLocation: Int = 0
        var shouldContinue = true

        switch color {
            
        case K.white:
            
            outerLoop: for piece in K.whitePieces {
                if piece.imageName == "whiteKing" {
                    kingLocation = piece.location
                    break outerLoop
                }
            }
            
            outerLoop: for piece in K.blackPieces {
                if piece.isAvailableSquare(Tile(kingLocation)) {
                    inCheck = true
                    break outerLoop
                }
            }
            
        case K.black:
            outerLoop: for piece in K.blackPieces {
                if piece.imageName == "blackKing" {
                    kingLocation = piece.location
                    break outerLoop
                }
            }
            

            outerLoop: for piece in K.whitePieces {
                if piece.isAvailableSquare(Tile(kingLocation)) {
                    inCheck = true
                    break outerLoop
                }
            }
        default:
            break
        }
        
        return inCheck
    }
        
    
    
    
}

