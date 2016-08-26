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
    
    @IBAction func goToSavedArticles(sender: AnyObject) {}
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func save(sender: AnyObject) {}
    @IBOutlet weak var swipeLeftTest: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    
    
    //sets up info view controller as chid VC
    @IBAction func info(sender: AnyObject) {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("infoPopUp") as! PopUpViewController
        self.addChildViewController(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view )
        popUpVC.didMoveToParentViewController(self)
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
            searchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "%20")
            requestURL = searchTerm
        }
        
        let headers = [
            "X-backend-news-token": "9320d5b271b105247a82e74dd8d78924251d3cb46f4da5ecae455bbcc3fd9b47bce0702b21050ad4cd5175e587efdb22fa2d3649fa6baeea96de8ca6afc80896"
        ]
        
        Alamofire.request(.GET, "https://backend-news-api.herokuapp.com/\(requestURL)/\(self.page)", headers: headers).validate().responseJSON { response in
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
                    self.self.saveButton.enabled = true
                    
                    if self.articles.count == 0 {
                        self.articleTitle.text = "Sorry, no articles matched that search term"
                    } else {
                    self.articleTitle.text = self.articles[self.swipes]
                    self.page += 1
                    self.activityIndicator.stopAnimating()
                    }
                }
            case .Failure(let error):
                print(error)
                self.saveButton.enabled = false
                self.activityIndicator.stopAnimating()
                self.articleTitle.text = "NO WIFI"
            }
        }
    }
    
    //iterate through article array to show next title
    func showCurrentTitle(ind: Int) {
        self.articleTitle.text = self.articles[swipes]
    }
    
    //ensure that user can't save article before it loads
    override func viewWillAppear(animated: Bool) {
        if articles.count == 0 {
        saveButton.enabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        self.saveButton.layer.cornerRadius = 10
        
        if swipes == 0 {
            updateArticleArray()
        } else {
           showCurrentTitle(swipes)
        }
        
        //set up gesture recognizers
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
            performSegueWithIdentifier("fullArticle", sender: nil)
        } else {
            performSegueWithIdentifier("home", sender: nil)
        }
    }
    
    func goHome(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Down {
            performSegueWithIdentifier("home", sender: nil)
        }
    }
    
    func search(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Up {
            performSegueWithIdentifier("search", sender: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
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
                    segue.destinationViewController as! ViewController
                case "toSaved":
                    segue.destinationViewController as! SavedArticlesTableViewController
                case "search":
                    segue.destinationViewController as! SearchViewController
            default:
                break
            }
            
        }

    }
    
    

}
