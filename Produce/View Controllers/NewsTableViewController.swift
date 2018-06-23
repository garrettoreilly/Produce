//
//  NewsTableViewController.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class NewsTableViewController: UITableViewController {
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Response.fetchArticles { (fetchedArticles) in
            self.articles = fetchedArticles!
            self.tableView.reloadData()
        }
        
        navigationItem.title = "Top News"
        view.backgroundColor = .black
        tableView.separatorStyle = .none
        
        tableView.rowHeight = 150
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "articleCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell

        cell.article = articles[indexPath.row]
        cell.layoutSubviews()
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = articles[indexPath.row].url else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredBarTintColor = .black
        safariViewController.preferredControlTintColor = .white
        present(safariViewController, animated: true, completion: nil)
    }
}
