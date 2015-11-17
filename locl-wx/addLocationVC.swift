//
//  addLocationVC.swift
//  locl-wx
//
//  Created by Jack Davis on 11/17/15.
//  Copyright © 2015 Nine42 LLC. All rights reserved.
//

import UIKit

class addLocationVC: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var zipcodeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a subtle shadow underneath header view
        headerView.layer.shadowColor = UIColor.blackColor().CGColor
        headerView.layer.shadowOffset = CGSizeZero
        headerView.layer.shadowRadius = 3
        headerView.layer.shadowOpacity = 1
        
    }
    
    @IBAction func saveZipcodeTapped(sender: AnyObject) {
        if zipcodeField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please Enter Zip", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(zipcodeField.text, forKey: "zipcode")
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func backBtnTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
