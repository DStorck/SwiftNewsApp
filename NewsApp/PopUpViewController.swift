//
//  PopUpViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/24/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBAction func closePopUp(sender: AnyObject) {
        self.view.removeFromSuperview()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.closeButton.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        self.infoLabel.text = "Swipe left to read article. \n\nSwipe right to search through more articles.  \n\nSwipe up to enter your own search term.  \n\nSwipe down to return to the home screen."

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
