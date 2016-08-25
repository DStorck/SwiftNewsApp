//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/17/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
   
    
    @IBOutlet weak var searchInput: UITextField!
    
    @IBAction func doSearch(sender: AnyObject) {
        var input = String(searchInput.text)
        print("input please:\(input)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchButton.layer.cornerRadius = 10;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let DestViewController: ArticlesViewController = segue.destinationViewController as! ArticlesViewController
            DestViewController.newsCategory = NewsCategory(rawValue: (sender?.tag)!)!
            DestViewController.searchTerm = searchInput.text!
        
    }

}
