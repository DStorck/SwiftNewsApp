//
//  FullArticleViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/15/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit

class FullArticleViewController: UIViewController {
    
    var testing = String()
    var for_realz = String()
    
    
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: self.for_realz)
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  

}
