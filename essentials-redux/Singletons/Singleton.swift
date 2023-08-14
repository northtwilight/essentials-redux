//
//  Singleton.swift
//  essentials-redux
//
//  Created by Massimo Savino on 2023-08-08.
//

import UIKit

// Singleton with a capital S


// Main module


extension ApiClient {
    func login(completion : (LoggedInUser) -> Void) {}
}

extension ApiClient {
    func loadFeed(completion: ([FeedItem]) -> Void) {}
}

extension ApiClient {
    func loadFollowers(completion: ([Follower]) -> Void) {}
}

// API module

class ApiClient {
    // Static lets are constant and lazy-loaded by default
    static let shared = ApiClient()
    
    func execute(_: URLRequest, completion: (Data) -> Void) {}
    
    
    
    
}

// Login module

struct LoggedInUser {}



class LoginViewController: UIViewController {
    // Login closure embedded in a closure callback
    var login: (((LoggedInUser) -> Void) -> Void)?
    
    func didTapLoginButton() {
        login? { user in
            // show next screen
        }
    }
}


// Feed module
struct FeedItem {}

class FeedViewController: UIViewController {
    var loadFeed: ((([FeedItem]) -> Void) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed? { loadedItems in
            // update feed page with items
        }
    }
}


// Followers module

struct Follower {}

class FollowersViewController: UIViewController {
    var loadFollowers: ((([Follower]) -> Void) -> Void)?
    
    override func viewDidLoad() {
        loadFollowers? { followers in
            // update UI with followers found
        }
    }
}


