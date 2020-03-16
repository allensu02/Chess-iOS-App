//
//  ViewController.swift
//  Chess
//
//  Created by Allen Su on 2020/3/8.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class ChessViewController: UIViewController {

    @IBOutlet var tileButtons : [UIButton]!

    var whitePieces: [Piece] = []
    var blackPieces: [Piece] = []
    
    var turn: String = K.white
    var allTiles = [Tile]()
    
    var oldTile: Tile?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpBoard()
        
        setUpPieces()
        updateBoard()
        
        
    }

    
    func setUpBoard () {
        var count = 0
        var numRow = 1
        for row in 1...8 {
            var numCol = 1
            for button in 1...8 {
                tileButtons[count].tag = numRow*10 + numCol
                numCol += 1
                count += 1
            }
            numRow += 1
        }
        for tileButton in tileButtons {
            tileButton.setTitle("", for: .normal)
            
            var ones = tileButton.tag % 10
            var tens = tileButton.tag/10
            let sum = ones + tens
            if sum % 2 == 0 {
                tileButton.backgroundColor = K.colorLight
            } else {
                tileButton.backgroundColor = K.colorDark
            }
            allTiles.append(Tile(tileButton, tileTag: tileButton.tag))
        }
        
    }
    
    func updateBoard () {
        for piece in whitePieces {
            updatePiece(piece)
        }
        for piece in blackPieces {
            updatePiece(piece)
        }
    }
    
    func updatePiece (_ piece: Piece) {
        let int = piece.location.location
        for button in tileButtons {
            if int == button.tag {
                let image = UIImage(named: piece.imageName)
                button.setBackgroundImage(image, for: .normal)
                if piece.isActive == true {
                    button.isEnabled = true
                } else {
                    button.isEnabled = false
                }
            }
        }
    }
    
    func setUpPieces () {
        
        var location = Location(0)
        
        for i in 1...8 {
            location.changeLocation(20+i)
            addPiece(piece: Pawn(active: true, loc: location, side: K.white))
            location.changeLocation(70+i)
            addPiece(piece: Pawn(active: true, loc: location, side: K.black))
            
        }
        
        for i in 1...3 {
            switch i {
            case 1:
                location.changeLocation(10 + 1)
                addPiece(piece: Rook(active: true, loc: location, side: K.white))
                location.changeLocation(10 + 8)
                addPiece(piece: Rook(active: true, loc: location, side: K.white))
                location.changeLocation(80 + 1)
                addPiece(piece: Rook(active: true, loc: location, side: K.black))
                location.changeLocation(80 + 8)
                addPiece(piece: Rook(active: true, loc: location, side: K.black))
            case 2:
                location.changeLocation(10 + 2)
                addPiece(piece: Knight(active: true, loc: location, side: K.white))
                location.changeLocation(10 + 7)
                addPiece(piece: Knight(active: true, loc: location, side: K.white))
                location.changeLocation(80 + 2)
                addPiece(piece: Knight(active: true, loc: location, side: K.black))
                location.changeLocation(80 + 7)
                addPiece(piece: Knight(active: true, loc: location, side: K.black))
            case 3:
                location.changeLocation(10 + 3)
                addPiece(piece: Bishop(active: true, loc: location, side: K.white))
                location.changeLocation(10 + 6)
                addPiece(piece: Bishop(active: true, loc: location, side: K.white))
                location.changeLocation(80 + 3)
                addPiece(piece: Bishop(active: true, loc: location, side: K.black))
                location.changeLocation(80 + 6)
                addPiece(piece: Bishop(active: true, loc: location, side: K.black))
            default:
                print("error with adding rooks, knights, and bishops")
            }
            
            location.changeLocation(10 + 4)
            addPiece(piece: Queen(active: true, loc: location, side: K.white))
            location.changeLocation(80 + 5)
            addPiece(piece: Queen(active: true, loc: location, side: K.black))
            location.changeLocation(10 + 5)
            addPiece(piece: King(active: true, loc: location, side: K.white))
            location.changeLocation(80 + 4)
            addPiece(piece: King(active: true, loc: location, side: K.black))
            
        }
        
    }
    
    func addPiece (piece: Piece) {
        if piece.color == K.white {
            whitePieces.append(piece)
        } else {
            blackPieces.append(piece)
        }
        let location = piece.location
        var num = (location.getY() - 1) * 8 + location.getX() - 1
        allTiles[num].addPiece(piece)
        
        
    }
    
    
    func startGame() {
        turn = K.white
        
    }
    
    func move () {
        
    }
    
    @IBAction func tileTouched(_ sender: UIButton) {
        let location = sender.tag
        let newTile = allTiles[location - 1]

        
        //if turn is white, and there is no tile touched yet, and the tile touched is same color as the turn, then tiletouched is the new tile.
        //if tiletouched isn't the same color, tiletouched is still nil
        //if there is a tile touched, and that new tile touched is an available square of tiletouched previously, then the piece will move to the new tile
        movePiece(sender: sender, newTile: newTile)
    }
    
    func movePiece (sender: UIButton, newTile: Tile) {

        if oldTile == nil {
            if newTile.piece?.color == turn {
                    print("ran")
                    oldTile = newTile
                    sender.backgroundColor = .lightGray
                } else {
                    oldTile = nil
                }
            } else {
            if (oldTile?.piece?.isAvailableSquare(newTile))!  {
                    newTile.addPiece(oldTile!.piece!)
                    oldTile?.removePiece()
                    nextTurn()
                } else {
                    oldTile = nil
                }
            }
   
    }
    
    func nextTurn () {
        if turn == K.white {
            turn = K.black
        } else {
            turn = K.white
        }
    }
}
    
    


