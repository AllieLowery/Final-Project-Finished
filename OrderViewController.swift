//
//  OrderViewController.swift
//  Final Project
//
//  Created by Allie Lowery on 4/26/23.
//

import UIKit

class OrderViewController: UIViewController {

    
    @IBOutlet weak var toppingOne: UITextField!
    
    @IBOutlet weak var toppingTwo: UITextField!
    
    @IBOutlet weak var toppingThree: UITextField!
    
    @IBOutlet weak var OrderList: UILabel!
    
    @IBOutlet weak var ShakeGestureLabel: UILabel!
    
    
    
    @IBAction func completeOrder(_ sender: UIButton) {
        
        OrderList.text = "A medium pizza with " + toppingOne.text! + ", " + toppingTwo.text! + ", and " + toppingThree.text! + ". Your total is $8. Please continue to the next tab!"
        
    }
    
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion==UIEvent.EventSubtype.motionShake {
            ShakeGestureLabel.text = "Please be Patient!!"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
