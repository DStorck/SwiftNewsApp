//
//  FullArticleViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/15/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit

class FullArticleViewController: UIViewController , UIWebViewDelegate{
    
    var article_url = String()
    
    @IBOutlet var webView: UIWebView!
    
    @IBAction func warning(sender: AnyObject) {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("noWifi") as! NoWifiViewController
        self.addChildViewController(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view )
        popUpVC.didMoveToParentViewController(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: self.article_url)
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("webview did fail load with error")
        warning(self)
    }


}
