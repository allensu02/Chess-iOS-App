//
//  Tile.swift
//  Chess
//
//  Created by Allen Su on 2020/3/9.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class Tile: UIButton {
    var location: Int = 0
    var piece: Piece?
    var index: Int = 0
    var y: Int = 0
    var x: Int = 0
    
    init(x: Int, y: Int) {
        super.init(frame: .zero)
        setTag(x + y*10)
    }

    init(_ loc: Int) {
        super.init(frame: .zero)
        setTag(loc)
    }
    
    func setTag (_ tagNum: Int) {
        tag = tagNum
    }
    
    func getX () -> Int {
        return tag%10
    }
    
    func getY() -> Int{
        return tag/10
    }
    
    func getLocation() -> Int {
        return tag
    }
    
    func getIndex() -> Int {
        let s = (self.getY()-1) * 8
        let p = self.getX() - 1
        
        return s + p
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
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
