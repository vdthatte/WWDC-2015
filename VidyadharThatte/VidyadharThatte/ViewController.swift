//
//  ViewController.swift
//  VidyadharThatte
//
//  Created by Vidyadhar V. Thatte on 4/25/15.
//  Copyright (c) 2015 Vidyadhar V Thatte. All rights reserved.
//

import UIKit
import MessageUI
import CoreLocation
import Parse

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, CLLocationManagerDelegate
{

    var customBody : String!
    var customPhone : String!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Button(sender: AnyObject) {
        if( MFMessageComposeViewController.canSendText() ){
            label.text = customPhone
            var messageVC = MFMessageComposeViewController()
            messageVC.body = customBody
            messageVC.recipients = [customPhone]
            messageVC.messageComposeDelegate = self;
            self.presentViewController(messageVC, animated: false, completion: nil)
        }
    }
    
    @IBAction func GetLocation(sender: AnyObject) {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }



    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemark, error)->Void in
            if (error != nil){
                println("reverse geocoder failed with error " + error.localizedDescription)
                return
            }
            if (placemark.count > 0){
                let pm = placemark[0] as! CLPlacemark
                self.displayLocationInfo(pm)
                
            }
            else{
                println("Problem with data from geocoder")
            }
        })
        
    }
    


    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(" Error while updating location " + error.localizedDescription)
    }
    
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch (result.value){
        case MessageComposeResultCancelled.value:
            println("Cancelled")
            label.text = "Cancelled"
            self.dismissViewControllerAnimated(true, completion: nil)
            
        case MessageComposeResultFailed.value:
            println("Failed")
            label.text = "Failed"
            self.dismissViewControllerAnimated(true, completion: nil)
        
        case MessageComposeResultSent.value:
            println("Sent")
            label.text = "Sent"
            self.dismissViewControllerAnimated(true, completion: nil)
        default:
            break
        }
    }
    
    func displayLocationInfo( placemark: CLPlacemark ){
        
        self.locationManager.stopUpdatingLocation()
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
        label.text = placemark.locality
        customBody = placemark.locality
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }

}


