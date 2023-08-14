//
//  FeedViewController.swift
//  essentials-redux
//
//  Created by Massimo Savino on 2023-08-14.
//

import UIKit

// Feed module

struct FeedItem {}

protocol FeedLoader {
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) -> Void
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

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) {
        // do something
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) {
        // do something
    }
}
