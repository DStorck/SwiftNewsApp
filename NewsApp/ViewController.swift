//
//  ViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/9/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

protocol ShowArticlesDelegate: class  {
    func ShowOneTitle(title: String) -> String
}

class ViewController: UIViewController, ShowArticlesDelegate{
    
    weak var delegate: ShowArticlesDelegate?
//    func ShowOneTitle(article: String) {
//        //just trying to figure out what is getting passed
//        delegate?.ShowOneTitle("taco")
//    }
    
    
//    func ShowOneTitle(controller: ArticlesViewController, text: String) {
//    controller.navigationController!.popViewControllerAnimated(true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
    }
    
    
    func assignBackground(){
        let background = UIImage(named: "background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getWorldNews(sender: AnyObject) {
        print("let's get the world news!")
        Alamofire.request(.GET, "http://localhost:3000/section/world")
            .responseJSON { response in
                if let JSON = response.result.value {
                    let arr = JSON as! NSArray
                    for item in arr {
                        print(item["title"])
                    }
                }
        }
        
    }
    
    @IBAction func getUSANews(sender: AnyObject) {
        print("usa news")
        Alamofire.request(.GET, "http://localhost:3000/us-news").validate().responseJSON { response in
            switch response.result {
            case .Success:
                var articles = [String]()
                if let value = response.result.value {
                    let json = JSON(value)
                    let firstTitle = json[0]["title"].stringValue
                    articles.append(firstTitle)
                    //print(json[0]["title"].stringValue)
                    print("first title")
                    print(firstTitle)
                    print(articles)
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    var articles = [String]()
    @IBAction func getSeattleNews(sender: AnyObject) {
        print("get some seattle news")
        Alamofire.request(.GET, "http://localhost:3000/us-news").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    for (_,subJson):(String, JSON) in json {
                        let tit = String(subJson["title"])
                        self.articles.append(tit)
                    }
                    print(self.articles)
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func getPoliticalNews(sender: AnyObject) {
        print("hear how depressing politics are")
    
    }
    
    @IBAction func getScienceNews(sender: AnyObject) {
        print("science.boom!")
        Alamofire.request(.GET, "http://localhost:3000/section/science")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    let arr = JSON as! NSArray
                    for item in arr {
                        print(item["title"])
                    }
                }
        }
    }
    
    
    @IBAction func getCultureNews(sender: AnyObject) {
        print("culture thyself")
        Alamofire.request(.GET, "http://localhost:3000/section/culture")
            .responseJSON { response in
                if let JSON = response.result.value {
                    let arr = JSON as! NSArray
                    for item in arr {
                        print(item["title"])
                    }
                }
        }
    }
    
   let testArray = ["test 1", "test 2", "test 3"]
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "test") {
          print("this is printing right away isn't it?")
          print(articles)
          let DestViewController: ArticlesViewController = segue.destinationViewController as! ArticlesViewController
            //DestViewController.delegate = self
          DestViewController.article = testArray[0]//String(self.articles.count)
            func ShowOneTitle(
        }
    }
    

    
}

