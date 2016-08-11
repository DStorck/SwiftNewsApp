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
        let url = "http://localhost:3000/section/world"
        let myUrl = NSURL(string: url)
        let request = NSMutableURLRequest(URL:myUrl!)
        request.HTTPMethod = "GET"
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Print out response string
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            print("all done with response string")

            
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    print("dictionary???")
                    print(convertedJsonIntoDict)
                    
                    // Get value by key
                    //let firstNameValue = convertedJsonIntoDict[0]!["title"] as? String
                    //print(firstNameValue!)
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
    }

    @IBAction func getUSANews(sender: AnyObject) {
        print("usa news")
        Alamofire.request(.GET, "http://localhost:3000/fish")
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
    }
    
    @IBAction func getPoliticalNews(sender: AnyObject) {
        print("hear how depressing politics are")
    }
    
    @IBAction func getScienceNews(sender: AnyObject) {
        print("science.boom!")
    }
    
    
    @IBAction func getCultureNews(sender: AnyObject) {
        print("culture thyself")
    }
    
    
}

