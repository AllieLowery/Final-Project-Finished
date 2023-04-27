//
//  WelcomeViewController.swift
//  Final Project
//
//  Created by Allie Lowery on 4/26/23.
//

import UIKit
import WebKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var WebView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://homemadepizzaschool.com/7-best-homemade-pizza-topping-combinations/")
        let myRequest = URLRequest(url: myURL!)
        WebView.load(myRequest)
        

        
    }
    

}
