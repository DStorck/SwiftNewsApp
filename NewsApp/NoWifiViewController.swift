//
//  NoWifiViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/29/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit

class NoWifiViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!

    @IBAction func closeWarning(sender: AnyObject) {
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        self.closeButton.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    


}
