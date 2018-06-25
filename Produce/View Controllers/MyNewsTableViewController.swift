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

class MyNewsTableViewController: UITableViewController {
    
    var articles = [Article]()
    
    let query: [String: String] = [
        "sources": "the-economist, the-washington-post, reuters, independent, associated-press",
        "pageSize": "100",
        "apiKey": AccessKeys.newsAPI
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupRefreshControl()
        refreshArticles()
        
    }
    
    func setupView() {
        navigationItem.title = "My News"
        view.backgroundColor = .black
        tableView.separatorStyle = .none
        
        tableView.rowHeight = 150
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "articleCell")
    }
    
    func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshArticles), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshArticles() {
        Response.fetchArticles(query: query) { (fetchedArticles) in
            guard let articles = fetchedArticles else { return }
            self.articles = articles
            self.tableView.reloadData()
        }
        
        self.refreshControl?.endRefreshing()
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
        cell.mainImageView.image = UIImage()
        cell.layoutSubviews()
        
        // Cache the image for the article at the current indexPath
        if articles[indexPath.row].image == nil {
            if let urlString = articles[indexPath.row].urlToImage, let url = URL(string: urlString) {
                cell.fetchImage(with: url) { (image) in
                    self.articles[indexPath.row].image = image
                }
            }
        }
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlString = articles[indexPath.row].url, let url = URL(string: urlString)  else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredBarTintColor = .black
        safariViewController.preferredControlTintColor = .white
        present(safariViewController, animated: true, completion: nil)
    }
}
