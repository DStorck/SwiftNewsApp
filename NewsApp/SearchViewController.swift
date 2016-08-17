//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/17/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    func search() {
        print("did we make it to the search controller?")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        search()
        

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
