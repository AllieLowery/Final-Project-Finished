//
//  ViewController.swift
//  Final Project
//
//  Created by Allie Lowery on 4/26/23.
//

import UIKit
import MessageUI
import CoreLocation

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, CLLocationManagerDelegate {
    
    @IBAction func dislike(_ sender: Any) {
        (parent as! TBViewController).dislike+=1
    }
    
    
    @IBAction func like(_ sender: Any) {
        (parent as! TBViewController).like+=1
    }
    
    
    @IBOutlet weak var dislikeCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool){
        
        dislikeCount.text = String((parent as! TBViewController).dislike)
        likeCount.text = String((parent as! TBViewController).like)
        
    }
    
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let kshopLatitude: CLLocationDegrees = 39.92826
    let kshopLongitude: CLLocationDegrees = -79.69504
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        if newLocation.horizontalAccuracy >= 0 {
            let shop:CLLocation = CLLocation(latitude: kshopLatitude,longitude: kshopLongitude)
            let delta:CLLocationDistance = shop.distance(from: newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5
            if miles < 3 {
                locMan.stopUpdatingLocation()
                distanceLabel.text = "Enjoy your pizza!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Allie's Pizza Shop"
            }
        }
    }
    
    
    
    
    
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    
    @IBAction func sendSMS(_ sender: Any) {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = ["7245622206"]
        composeVC.body = "Hello. You have now opted in for order updates."
        
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609;
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
        
    }


}

