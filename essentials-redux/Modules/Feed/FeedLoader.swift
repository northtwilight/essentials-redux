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
