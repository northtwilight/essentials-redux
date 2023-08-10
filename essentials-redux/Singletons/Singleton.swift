//
//  Singleton.swift
//  essentials-redux
//
//  Created by Massimo Savino on 2023-08-08.
//

import UIKit

// Singleton with a capital S






// API module

class ApiClient {
    // Static lets are constant and lazy-loaded by default
    static let shared = ApiClient()
    
    func execute(_: URLRequest, completion: (Data) -> Void) {}
    
    
    
    
}

// class MockApiClient: ApiClient {}


// Login module

struct LoggedInUser {}

extension ApiClient {
    func login(completion : (LoggedInUser) -> Void) {}
}


class LoginViewController: UIViewController {
    var api = ApiClient.shared
    
    func didTapLoginButton() {
        api.login() { user in
            // show next screen
        }
    }
}


// Feed module
struct FeedItem {}

class FeedViewController: UIViewController {
    var api = ApiClient.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.loadFeed { loadedItems in
            // update feed page with items
        }
    }
}

extension ApiClient {
    func loadFeed(completion: ([FeedItem]) -> Void) {}
}

// Followers module
struct Follower {}
class FollowersViewController: UIViewController {
    var api = ApiClient.shared
    
    override func viewDidLoad() {
        api.loadFollowers { followers in
            // update UI with followers found
        }
    }
}

extension ApiClient {
    func loadFollowers(completion: ([Follower]) -> Void) {}
}
