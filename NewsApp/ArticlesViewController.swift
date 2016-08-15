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

enum NewsCategory: Int {
    case world = 0
    case us = 1
    case science = 4
    case culture = 5
    case seattle = 2
    case politics = 3
}

class ArticlesViewController: UIViewController /*, ShowArticlesDelegate*/ {

    var articles = [String]()
    var newsCategory: NewsCategory = .world
    

    func updateArticleArray() {
        var requestURL: String
        switch newsCategory {
        case .world:
            requestURL = "section/world"
        case .us:
            requestURL = "section/us-news"
        case .science:
            requestURL = "section/science"
        case .seattle:
            requestURL = "seattle"
        case .politics:
            requestURL = "section/politics"
        case .culture:
            requestURL = "section/culture"
        }
        
        Alamofire.request(.GET, "http://localhost:3000/\(requestURL)").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    for (_,subJson):(String, JSON) in json {
                        let tit = String(subJson["title"])
                        self.articles.append(tit)
                    }
                    print(self.articles)
                    self.articleTitle.text = self.articles[0]
                }
            case .Failure(let error):
                print(error)
            }
        }

    }
    
    @IBAction func loadNextArticle(sender: AnyObject) {
        print("OMG i swiped left!")
    }
    
    func ShowOneTitle(article: String) {
        print("did we make this work yet?")
    }
    
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateArticleArray()
        //articleTitle.text = articles[0]
    }
    
    
    @IBOutlet weak var articleTitle: UILabel!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func tap(sender: AnyObject) {
        print("foo")
    }

}
