//
//  ArticlesViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/11/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//


import UIKit
import Alamofire


class ArticlesViewController: UIViewController {

    @IBOutlet var showArticles: UITextField!
    
    var article = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showArticles.text = article

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
