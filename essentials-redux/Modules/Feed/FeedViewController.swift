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

class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    let remote: RemoteFeedLoader
    let local: LocalFeedLoader
    
    init(remote: RemoteFeedLoader, local: LocalFeedLoader) {
        self.remote = remote
        self.local = local
    }
    
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) {
        let load = Reachability.networkAvailable ?
            remote.loadFeed : local.loadFeed
        load(completion)
    }
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
