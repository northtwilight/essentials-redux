//
//  FeedViewController.swift
//  essentials-redux
//
//  Created by Massimo Savino on 2023-08-14.
//

import UIKit

// Dumb concrete dependency
struct Reachability {
    static let networkAvailable = false
}

class FeedViewController: UIViewController {
    var loader: FeedLoader!
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadFeed { loadedItems in
            // update feed page (UI) with items
        }
    }
}
