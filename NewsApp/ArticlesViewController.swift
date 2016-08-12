//
//  ArticlesViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/11/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON
import Foundation


class ArticlesViewController: UIViewController, ShowArticlesDelegate {

    @IBOutlet var showArticles: UILabel!

    var article = String()
    func ShowOneTitle(article: String) {
        print("did we make this work yet?")
    }
    
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showArticles.text = article
    }
    
    
    @IBOutlet weak var articleTitle: UILabel!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
