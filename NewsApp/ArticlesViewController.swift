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
//import RealmSwift


enum NewsCategory: Int {
    case world = 0
    case us = 1
    case science = 4
    case culture = 5
    case seattle = 2
    case politics = 3
    case breaking = 6
    case search = 7
}

class ArticlesViewController: UIViewController {

    
    var searchTerm = String()
    var articles = [String]()
    var article_dict = [String: String]()
    var newsCategory: NewsCategory = .world
    var swipes = 0
    var page = 1
    
    
    @IBAction func save(sender: AnyObject) {
    }
    
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
        case .breaking:
            requestURL = ""
        case .search:
            requestURL = searchTerm
        }
        
        Alamofire.request(.GET, "https://backend-news-api.herokuapp.com/\(requestURL)/\(self.page)").validate().responseJSON { response in
            switch response.result {
            case .Success:
                self.articles = []
                self.swipes = 0
                if let value = response.result.value {
                    let json = JSON(value)
                    for (_,subJson):(String, JSON) in json {
                        let tit = String(subJson["title"])
                        let guard_url = String(subJson["url"])
                        self.articles.append(tit)
                        self.article_dict[tit] = guard_url
                    }
                    print(requestURL)
                    print(self.articles)
                    
                    if self.articles.count == 0 {
                        self.articleTitle.text = "Sorry, no articles matched that search term"
                    } else {
                    self.articleTitle.text = self.articles[self.swipes]
                    self.page += 1
                    }
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func showCurrentTitle(ind: Int) {
        self.articleTitle.text = self.articles[swipes]
    }
    
    @IBAction func loadNextArticle(sender: AnyObject) {
        print("loadnextArticle method")
    }
    
    func ShowOneTitle(article: String) {
        print("did we make this work yet?")
    }
    
    @IBOutlet weak var swipeLeftTest: UILabel!
    
    
    //@IBOutlet var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if swipes == 0 {
            print("count: \(articles.count)")
            updateArticleArray()
        } else {
           showCurrentTitle(swipes)
        }
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ArticlesViewController.newArticleTitle(_:)))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ArticlesViewController.showFullArticle(_:)))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ArticlesViewController.goHome(_:)))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ArticlesViewController.search(_:)))
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeUp)
    
    }
    
    func newArticleTitle(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Right {
            print("swiped left")
            self.swipes += 1
            if articles.count == 0 {
               performSegueWithIdentifier("home", sender: nil)
            } else if swipes % 10 == 0 || swipes == 0 {
                updateArticleArray()
            } else {
                showCurrentTitle(swipes)
            }
        }
    }
    
    func showFullArticle(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Left && articles.count != 0 {
            print("swiped right")
            performSegueWithIdentifier("fullArticle", sender: nil)
        } else {
            performSegueWithIdentifier("home", sender: nil)
        }
    }
    
    func goHome(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Down {
            print("swiped down")
            performSegueWithIdentifier("home", sender: nil)
        }
    }
    
    func search(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Up {
            print("swiped up")
            performSegueWithIdentifier("search", sender: nil)
        }
    }
    
    
    @IBOutlet weak var articleTitle: UILabel!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    
//    @IBAction func tap(sender: AnyObject) {
//        print("foo")
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "addArticle":
                    let DestViewController = segue.destinationViewController as! SavedArticlesTableViewController
                    DestViewController.article_url = article_dict[articles[swipes]]!
                    DestViewController.article_title = articles[swipes]
                case "fullArticle":
                    let DestViewController = segue.destinationViewController as! FullArticleViewController
                    DestViewController.article_url = article_dict[articles[swipes]]!
                case "home":
                    let DestViewContoller = segue.destinationViewController as! ViewController
                case "search":
                    let DestViewController = segue.destinationViewController as! SearchViewController
            default:
                break
            }
            
        }

    }
    
    

}
