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

protocol ShowArticlesDelegate  {
    func showOneTitle(title: String) -> String
}

class ViewController: UIViewController {
    
    @IBAction func goToSavedArticles(sender: AnyObject) {}
    @IBOutlet weak var downloadActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var catchUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.search(_:)))
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeUp)
        
        assignBackground()
    }
    
    func search(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Up {
            print("swiped up")
            performSegueWithIdentifier("search", sender: nil)
        }
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
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "search":
                segue.destinationViewController as! SearchViewController
            case "toSaved":
                segue.destinationViewController as! SavedArticlesTableViewController
            default:
                let DestViewController: ArticlesViewController = segue.destinationViewController as! ArticlesViewController
                DestViewController.newsCategory = NewsCategory(rawValue: (sender?.tag)!)!
    
            }
        }
    }
   

    

    
}

