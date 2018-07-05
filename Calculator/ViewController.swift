//
//  ViewController.swift
//  Calculator
//
//  Created by Pawan Badsewal on 30/12/17.
//  Copyright © 2017 Pawan Badsewal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var perfMath:Bool = false
    var operation = 0
    var decimalAdded:Bool = false
    
    @IBOutlet var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if (perfMath == true){
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            perfMath = false
        }else{
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if ( label.text != "" && sender.tag != 11 && sender.tag != 16 ){
            previousNumber = Double(label.text!)!
            if (sender.tag == 12){  //Divide
                label.text = "÷"
            }else if (sender.tag == 13){  //Multi
                label.text = "X"
            }else if (sender.tag == 14){  //Subt
                label.text = "-"
            }else if (sender.tag == 15){  //Add
                label.text = "+"
            }
            decimalAdded = false
            perfMath = true
            operation = sender.tag
        }else if(sender.tag == 16 ){
            if (operation == 12){
                label.text = String(previousNumber / numberOnScreen)
            }else if (operation == 13){
                label.text = String(previousNumber * numberOnScreen)
            }else if (operation == 14){
                label.text = String(previousNumber - numberOnScreen)
            }else if (operation == 15){
                label.text = String(previousNumber + numberOnScreen)
            }
            decimalAdded = true
        }else if (sender.tag == 11){
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            decimalAdded = false
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        switch sender.tag {
        case 17:
            if (Double(label.text!)! >= 0){
                label.text!.insert("-", at: (label.text?.startIndex)!)
            }else{
                label.text!.remove(at: label.text!.startIndex)
            }
        case 18:
            previousNumber = Double(label.text!)!
            label.text = String(previousNumber / 100)
        case 19:
            if (decimalAdded == false){
                label.text = label.text! + "."
                decimalAdded = true
            }
        default:
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
