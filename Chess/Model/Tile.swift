//
//  Tile.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class Tile {
    var location: Location
    var piece: Piece?
    var tag: Int
    init(_ tile: UIButton, tileTag: Int) {
        location = Location(tile.tag)
        tag = tileTag
    }
    
    func addPiece (_ piece: Piece) {
        self.piece = piece
    }
    
    func removePiece () {
        piece = nil
        
    }
    
    func doesHavePiece ()  -> Bool {
        if piece != nil {
            return true
        } else {
            return false
        }
    }
    
    
}
