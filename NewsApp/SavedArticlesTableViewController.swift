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
    var article_array = [String]()
    var savedArticles = [String: String]()
    var all_articles: Results<Article>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        all_articles = realm.objects(Article)
        //save instance of article to realm article dohickey
        let article = Article()
        article.title = article_title
        article.url = article_url
        
        try! realm.write {
            realm.add(article)
        }
        
        print("all articles \(all_articles)")
        
        
        
        
        savedArticles[article_title] = article_title
        article_array.append(article_title)
        //print(article_array)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return savedArticles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let article = article_array[indexPath.row]

        let cell = tableView.dequeueReusableCellWithIdentifier("SavedArticlesTableViewCell", forIndexPath: indexPath) as! SavedArticlesTableViewCell
        
        cell.title.text = article_array[indexPath.row]
        //cell.title.text =
        
        
        
        
         // Configure the cell...
        

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("url \(article_url)")
        print(article_array)
        print(savedArticles)
        let DestViewController = segue.destinationViewController as! FullArticleViewController
        DestViewController.article_url = article_url
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

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
