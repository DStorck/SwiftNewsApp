//
//  SearchViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/17/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var searchInput: UITextField!
    
    @IBAction func doSearch(sender: AnyObject) {
        var input = String(searchInput.text)
        print("we are in the DoSearch method")
        print("input please:\(input)")
    }
    
    func search() {
        print("we are in the search method")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search()
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
