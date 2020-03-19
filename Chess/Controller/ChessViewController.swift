//
//  ViewController.swift
//  Chess
//
//  Created by Allen Su on 2020/3/8.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class ChessViewController: UIViewController {

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet var allTiles: [Tile]!
    

    
    var turn: String = K.white
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpBoard()
        setUpPieces()
        updateBoard()
        
       
        
    }

//MARK: - Setting up initial board
    func setUpBoard () {
        var count = 0
        var numRow = 1
        
        //sets the tag for each tile based on row and column
        for row in 1...8 {
            var numCol = 1
            for button in 1...8 {
                allTiles[count].tag = numRow*10 + numCol
                numCol += 1
                count += 1
            }
            numRow += 1
        }
        for tileButton in allTiles {
            tileButton.setTitle("", for: .normal)
            
            setDefaultTileColor(tileButton: tileButton)
        }
        
    }
    
    //sets dark and light tile colors
    func setDefaultTileColor (tileButton: UIButton) {
        var ones = tileButton.tag % 10
        var tens = tileButton.tag/10
        let sum = ones + tens
        if sum % 2 == 0 {
            tileButton.backgroundColor = K.colorLight
            } else {
                tileButton.backgroundColor = K.colorDark
            }
    }
    
    
    func updateBoard () {
        for piece in K.whitePieces {
            updatePiece(piece)
        }
        for piece in K.blackPieces {
            updatePiece(piece)
        }
    }
    
    
    func updatePiece (_ piece: Piece) {
        let int = piece.location
        for tile in allTiles {
            if int == tile.tag {
                let image = UIImage(named: piece.imageName)
                tile.setBackgroundImage(image, for: .normal)
                if piece.isActive == true {
                    tile.isEnabled = true
                } else {
                    tile.isEnabled = false
                }
            }
        }
    }
    
    func updateTile (_ tile: Tile) {
        
        if tile.doesHavePiece() {
            tile.setBackgroundImage(UIImage(named: tile.piece!.imageName), for: .normal)
        
        } else {
            tile.setBackgroundImage(.none, for: .normal)
        }
        
    }
    func setUpPieces () {
        
        
        for i in 1...8 {
            addPiece(piece: Pawn(active: true, loc: 20+i, side: K.white))
            addPiece(piece: Pawn(active: true, loc: 70+i, side: K.black))
            
        }
        
        for i in 1...3 {
            switch i {
            case 1:
                addPiece(piece: Rook(active: true, loc: 10 + 1, side: K.white))
                addPiece(piece: Rook(active: true, loc: 10 + 8, side: K.white))
                addPiece(piece: Rook(active: true, loc: 80 + 1, side: K.black))
                addPiece(piece: Rook(active: true, loc: 80 + 8, side: K.black))
            case 2:
                addPiece(piece: Knight(active: true, loc: 10 + 2, side: K.white))
                addPiece(piece: Knight(active: true, loc: 10 + 7, side: K.white))
                addPiece(piece: Knight(active: true, loc: 80 + 2, side: K.black))
                addPiece(piece: Knight(active: true, loc: 80 + 7, side: K.black))
            case 3:
                addPiece(piece: Bishop(active: true, loc: 10 + 3, side: K.white))
                addPiece(piece: Bishop(active: true, loc: 10 + 6, side: K.white))
                addPiece(piece: Bishop(active: true, loc: 80 + 3, side: K.black))
                addPiece(piece: Bishop(active: true, loc: 80 + 6, side: K.black))
            default:
                print("error with adding rooks, knights, and bishops")
            }
            
        }
        addPiece(piece: Queen(active: true, loc: 10 + 4, side: K.white))
        addPiece(piece: Queen(active: true, loc: 80 + 5, side: K.black))
        addPiece(piece: King(active: true, loc: 10 + 5, side: K.white))
        addPiece(piece: King(active: true, loc: 80 + 4, side: K.black))
    }
    
    func addPiece (piece: Piece) {
        if piece.color == K.white {
            K.whitePieces.append(piece)
        } else {
            K.blackPieces.append(piece)
        }
        var num = (piece.y - 1) * 8 + piece.x - 1
        allTiles[num].addPiece(piece)
        
        
    }
    
    
    func startGame() {
        turn = K.white
        
    }
    
    

    @IBAction func tileTouched(_ sender: Tile) {
        movePiece(newTile: sender)
    }
    
    //if turn is white, and there is no tile touched yet, and the tile touched is same color as the turn, then tiletouched is the new tile.
    //if tiletouched isn't the same color, tiletouched is still nil
    //if there is a tile touched, and that new tile touched is an available square of tiletouched previously, then the piece will move to the new tile
    
    var oldTile: Tile?

    var count = 0
    func movePiece (newTile: Tile) {
        K.tilesArray = allTiles
        if oldTile == nil {
            if newTile.piece?.color == turn {
                oldTile = newTile
                newTile.backgroundColor = .green
                
            } else {
                oldTile = nil
                setDefaultTileColor(tileButton: newTile)
            }
        } else if oldTile != nil {
            
            if (oldTile!.piece!.isAvailableSquare(newTile))  {
                oldTile!.piece!.Move(newLocation: newTile.tag)
                newTile.addPiece(oldTile!.piece!)
                oldTile?.removePiece()
                updateTile(oldTile!)
                updateTile(newTile)
                nextTurn()
                setDefaultTileColor(tileButton: oldTile!)
                oldTile = nil
                } else {
                    setDefaultTileColor(tileButton: oldTile!)
                    oldTile = nil

                }
            }
   
    }
    
    
    func nextTurn () {
        
        if turn == K.white {
            turnLabel.text = "Turn: \(K.black)"
            turn = K.black
        } else {
            turnLabel.text = "Turn: \(K.white)"
            turn = K.white
        }
        
        
    }
}
    
    


