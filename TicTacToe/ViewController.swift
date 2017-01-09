//
//  ViewController.swift
//  TicTacToe
//
//  Created by Brian W Thyfault on 11/18/16.
//  Copyright © 2016 Brian W Thyfault. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var gameBoard: UIView!
    @IBOutlet weak var r1c1: GridLabel!
    @IBOutlet weak var r1c2: GridLabel!
    @IBOutlet weak var r1c3: GridLabel!
    @IBOutlet weak var r2c1: GridLabel!
    @IBOutlet weak var r2c2: GridLabel!
    @IBOutlet weak var r2c3: GridLabel!
    @IBOutlet weak var r3c1: GridLabel!
    @IBOutlet weak var r3c2: GridLabel!
    @IBOutlet weak var r3c3: GridLabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var gameArray:[GridLabel] = []
    var myGrid = GridLabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        gameArray = [r1c1, r1c2, r1c3, r2c1, r2c2, r2c3, r3c1, r3c2, r3c3]
        
    }
    
    
    @IBAction func boardTapped(_ sender: AnyObject)
    {
        
        for label in gameArray
        {
            if(label.frame.contains(sender.location(in: gameBoard)) && label.text == "")
            {
                if(myGrid.xTurn == true)
                {
                    label.text = "X"
                    myGrid.xTurn = false
                }
                else
                {
                    label.text = "O"
                    myGrid.xTurn = true
                }
                myGrid.count += 1
                
            }
            
        }
        checkWinner()
    }
    
    func clearBoard()
    {
        r1c1.text = ""
        r1c2.text = ""
        r1c3.text = ""
        r2c1.text = ""
        r2c2.text = ""
        r2c3.text = ""
        r3c1.text = ""
        r3c2.text = ""
        r3c3.text = ""
        myGrid.count = 0
    }
    
    func winnerAlert(_ winner:String)
    {
        var alert = UIAlertController()
        
        if(winner == "count9")
        {
            alert = UIAlertController(title: "Cat's Game", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        }
        else
        {
            alert = UIAlertController(title: "\(winner) Wins!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        }
            alert.addAction(UIAlertAction(title: "Reset Board", style: .default, handler: {
            (sender) in self.clearBoard()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    func checkWinner()
    {
        
        if((r1c1.text == r1c2.text && r1c2.text == r1c3.text) && r1c1.text != "")
        {
            winnerAlert(r1c1.text!)
            
        }
        else if((r2c1.text == r2c2.text && r2c2.text == r2c3.text) && r2c1.text != "")
        {
            winnerAlert(r2c1.text!)
            
        }
        else if((r3c1.text == r3c2.text && r3c2.text == r3c3.text) && r3c1.text != "")
        {
            winnerAlert(r3c1.text!)
            
        }
        else if((r1c1.text == r2c1.text && r2c1.text == r3c1.text) && r1c1.text != "")
        {
            winnerAlert(r1c1.text!)
            
        }
        else if((r1c2.text == r2c2.text && r2c2.text == r3c2.text) && r1c2.text != "")
        {
            winnerAlert(r1c2.text!)
            
        }
        else if((r1c3.text == r2c3.text && r2c3.text == r3c3.text) && r3c3.text != "")
        {
            winnerAlert(r1c3.text!)
            
        }
        else if((r1c1.text == r2c2.text && r2c2.text == r3c3.text) && r1c1.text != "")
        {
            winnerAlert(r1c1.text!)
            
        }
        else if((r1c3.text == r2c2.text && r2c2.text == r3c1.text) && r1c3.text != "")
        {
            winnerAlert(r1c3.text!)
            
        }
        else if (myGrid.count >= 9)
        {
            winnerAlert("count9")
        }
        
    }
    
    @IBAction func resetButton(_ sender: AnyObject)
    {
        clearBoard()
    }
    

}

