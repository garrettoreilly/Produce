//
//  ViewController.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Response.fetchArticle { (articles) in
            if let articles = articles {
                for article in articles {
                    print(article)
                }
            }
        }
    }


}

