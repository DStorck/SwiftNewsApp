//
//  ViewController.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/9/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

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
        Alamofire.request(.GET, "http://localhost:3000/us-news")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                   // print("JSON: \(JSON)")
                    let arr = JSON as! NSArray
                    for item in arr {
                        print(item["title"])
                    }
                }
        }
    }
    
    @IBAction func getSeattleNews(sender: AnyObject) {
        print("get some seattle news")
        Alamofire.request(.GET, "http://localhost:3000/seattle")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    let arr = JSON as! NSArray
                    for item in arr {
                        print(item["title"])
                    }
                }
        }
    }
    
    @IBAction func getPoliticalNews(sender: AnyObject) {
        print("hear how depressing politics are")
        Alamofire.request(.GET, "http://localhost:3000/section/politics")
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    let arr = JSON as! NSArray
                    for item in arr {
                        print(item["title"])
                    }
                }
        }
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController: ArticlesViewController = segue.destinationViewController as! ArticlesViewController
        DestViewController.article = "you are a turkey face"
    }
    
    
}

