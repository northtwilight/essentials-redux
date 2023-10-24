//
//  FeedLoader.swift
//  essentials-redux
//
//  Created by Massimo Savino on 2023-08-14.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func loadFeed(completion: @escaping (LoadFeedResult) -> Void) -> Void
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping (LoadFeedResult) -> Void) {
        // do something
    }
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping (LoadFeedResult) -> Void) {
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
    
    func loadFeed(completion: @escaping (LoadFeedResult) -> Void) {
        let load = Reachability.networkAvailable ?
            remote.loadFeed : local.loadFeed
        load(completion)
    }
}

let vc = FeedViewController(loader: RemoteFeedLoader())
let vc2 = FeedViewController(loader: LocalFeedLoader())
let vc3 = FeedViewController(loader: RemoteWithLocalFallbackFeedLoader(
    remote: RemoteFeedLoader(),
    local: LocalFeedLoader()))
