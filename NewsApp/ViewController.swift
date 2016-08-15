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

class ViewController: UIViewController, ShowArticlesDelegate {
    var articles = ["is this going in?"] //[String]()
//    weak var delegate: ShowArticlesDelegate?
    @IBOutlet weak var downloadActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usaButton: UIButton!
    
//    func ShowOneTitle(article: String) {
//        //just trying to figure out what is getting passed
//        delegate?.ShowOneTitle("taco")
//    }
    
    func showOneTitle(title: String) -> String {
        return "Hello title"
    }
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


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue, \(segue.identifier)")
        print("this is printing right away isn't it?")
        print(articles)
        let DestViewController: ArticlesViewController = segue.destinationViewController as! ArticlesViewController
        DestViewController.newsCategory = NewsCategory(rawValue: (sender?.tag)!)!
        //DestViewController.delegate = self
        //let firstArticle = String(articles)
    }
    
    

    
}

