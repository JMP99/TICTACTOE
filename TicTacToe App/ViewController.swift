//
//  ViewController.swift
//  TicTacToe App
//
//  Created by Student on 11/15/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
        
        
        
        
    }
    
    func displayWinningMessage(message:String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func checkForWinner() {
        
        //checking first row
    if labelsArray[0].text != "" &&
    labelsArray[0].text! == labelsArray[1].text! && labelsArray[1].text! == labelsArray[2].text! {
        displayWinningMessage(message:"\(labelsArray[0].text!) is the winner!")
    }
  else  if labelsArray[3].text != "" &&
            labelsArray[3].text! == labelsArray[4].text! && labelsArray[4].text! == labelsArray[5].text! {
            displayWinningMessage(message:"\(labelsArray[3].text!) is the winner!")

    }
      else  if labelsArray[6].text != "" &&
            labelsArray[6].text! == labelsArray[7].text! && labelsArray[7].text! == labelsArray[8].text! {
            displayWinningMessage(message:"\(labelsArray[6].text!) is the winner!")
        
        
        }
        
      else  if labelsArray[0].text != "" &&
            labelsArray[0].text! == labelsArray[3].text! && labelsArray[3].text! == labelsArray[6].text! {
            displayWinningMessage(message:"\(labelsArray[0].text!) is the winner!")
        }
      else  if labelsArray[1].text != "" &&
            labelsArray[1].text! == labelsArray[4].text! && labelsArray[4].text! == labelsArray[7].text! {
            displayWinningMessage(message:"\(labelsArray[1].text!) is the winner!")
        
        }
        
     else   if labelsArray[2].text != "" &&
            labelsArray[2].text! == labelsArray[5].text! && labelsArray[5].text! == labelsArray[8].text! {
            displayWinningMessage(message:"\(labelsArray[2].text!) is the winner!")
        }
      else  if labelsArray[6].text != "" &&
            labelsArray[6].text! == labelsArray[4].text! && labelsArray[4].text! == labelsArray[2].text! {
            displayWinningMessage(message:"\(labelsArray[6].text!) is the winner!")
        }
      else  if labelsArray[0].text != "" &&
            labelsArray[0].text! == labelsArray[4].text! && labelsArray[4].text! == labelsArray[8].text! {
            displayWinningMessage(message:"\(labelsArray[0].text!) is the winner!")
            
        }
    }
    
    
  


  
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        if gameOver {
            return
        }
        var canPlay = false
        for label in labelsArray {
            if label.frame.contains(sender.location(in: backgroundView)){
                if label.canTap {
                if(xTurn) {
                label.text = "X"
                    }
                else {
                    label.text = "O"
                    
                }
           xTurn = !xTurn
        label.canTap = false
        checkForWinner()
}
            }
            if label.canTap {
 canPlay = true
}
}
    if !canPlay && !gameOver {
    displayWinningMessage(message: "Cats Game")
    }
}

func resetGame() {
for label in labelsArray {
    label.text = ""
    label.canTap = true
}
xTurn = false
gameOver = false
}





}

