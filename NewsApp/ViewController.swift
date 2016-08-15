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
    
    @IBOutlet weak var downloadActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usaButton: UIButton!


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
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController: ArticlesViewController = segue.destinationViewController as! ArticlesViewController
        DestViewController.newsCategory = NewsCategory(rawValue: (sender?.tag)!)!
    }
    

    
}

