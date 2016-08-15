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

class ArticlesViewController: UIViewController {

    var articles = [String]()
    var article_dict = [String: String]()
    var newsCategory: NewsCategory = .world
    var swipes = 0
    
    func updateArticleArray(article: Int) {
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
        
        Alamofire.request(.GET, "https://backend-news-api.herokuapp.com/\(requestURL)").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    for (_,subJson):(String, JSON) in json {
                        let tit = String(subJson["title"])
                        let guard_url = String(subJson["url"])
                        self.articles.append(tit)
                        self.article_dict[tit] = guard_url
                    }
                    print(self.article_dict)
                    self.articleTitle.text = self.articles[article]
                }
            case .Failure(let error):
                print(error)
            }
        }

    }
    
//    @IBAction func loadNextArticle(sender: AnyObject) {
//        print("OMG i swiped left!")
//    }
    
    func ShowOneTitle(article: String) {
        print("did we make this work yet?")
    }
    
    @IBOutlet weak var swipeLeftTest: UILabel!
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateArticleArray(swipes)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ArticlesViewController.newArticleTitle(_:)))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ArticlesViewController.showFullArticle(_:)))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        

    }
    
    func newArticleTitle(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Right {
            print("please work please please swipe LEFT LEFT LEFT ")
            self.swipes += 1
            updateArticleArray(swipes)
        }
    }
    
    func showFullArticle(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Left {
            print("please work please please swipe RIGHT RIGHT RIGHT ")
            performSegueWithIdentifier("fullArticle", sender: nil)
        }
    }
    
    
    @IBOutlet weak var articleTitle: UILabel!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func tap(sender: AnyObject) {
        print("foo")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController: FullArticleViewController = segue.destinationViewController as! FullArticleViewController
        DestViewController.article_url = article_dict[articles[swipes]]!
        
    }

}
