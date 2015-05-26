//
//  LandingScene.swift
//  VidyadharThatte
//
//  Created by Vidyadhar V. Thatte on 4/26/15.
//  Copyright (c) 2015 Vidyadhar V Thatte. All rights reserved.
//

import UIKit
import Parse

class LandingScene: UIViewController {
    @IBOutlet weak var phone: UITextField!
    var phoneNumber : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
        

    
    @IBAction func Done(sender: AnyObject) {
        if(count(phone.text) != 10){
            var alert = UIAlertController(title: "Invalid Number", message: "Number has to be 10 digits", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            let vc : UITableViewController = History()
            presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    
    
}
