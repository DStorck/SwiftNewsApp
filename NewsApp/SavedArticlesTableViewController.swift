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
        self.title = "Saved Articles"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        realm_articles = realm.objects(Article)
        let article = Article()
        article.title = article_title
        article.url = article_url
        
        let doesArticleExist = try! Realm().objects(Article).filter("title == %@", article_title).first
        if article_url != "" && doesArticleExist == nil {
            try! realm.write {
                realm.add(article)
            }
        }
        
        print(realm_articles)
    }
    
    override func viewWillAppear(animated: Bool) {
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

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let article = realm_articles[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("SavedArticlesTableViewCell", forIndexPath: indexPath) as! SavedArticlesTableViewCell
        cell.title.text = article.title
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let artToDelete = realm_articles[indexPath.row]
            try! realm.write {
                realm.delete(artToDelete)
            }
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController = segue.destinationViewController as! FullArticleViewController
        let articleIndex = tableView.indexPathForSelectedRow?.row
        print(articleIndex)
        DestViewController.article_url = realm_articles[articleIndex!].url!
    }
    
}
