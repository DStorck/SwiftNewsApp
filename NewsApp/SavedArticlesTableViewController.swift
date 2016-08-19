//
//  SavedArticlesTableViewController.swift
//  
//
//  Created by Deirdre Storck on 8/18/16.
//
//

import UIKit
import RealmSwift


class SavedArticlesTableViewController: UITableViewController {
    
    let realm = try! Realm()
    var article_url = String()
    var article_title = String()
    var realm_articles: Results<Article>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm_articles = realm.objects(Article)
        let article = Article()
        article.title = article_title
        article.url = article_url
        
        try! realm.write {
            realm.add(article)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        //so that the table data will refresh when the page is visited again
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm_articles.count
    }

    var valueToPass: String!
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let article = realm_articles[indexPath.row]

        let cell = tableView.dequeueReusableCellWithIdentifier("SavedArticlesTableViewCell", forIndexPath: indexPath) as! SavedArticlesTableViewCell
        
        cell.title.text = article.title
        valueToPass = article.url
        
        return cell
        
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController = segue.destinationViewController as! FullArticleViewController
        let articleIndex = tableView.indexPathForSelectedRow?.row
        print(articleIndex)
        DestViewController.article_url = realm_articles[articleIndex!].url!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */




}
