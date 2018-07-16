//
//  GitHubClient.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 15.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Moya
import Result

class GitHubClient: BaseClient<GitHubService> {
    
    // MARK: Class variables & properties
    
    static let shared = {
        return GitHubClient()
    }()
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    @discardableResult
    func searchRepositories(withQuery query: String, completion: @escaping RequestCompletion<GitHub_SearchRepositories>) -> Cancellable {
        let target = GitHubService.searchRepositories(query: query)
        let request = self.request(toTarget: target, withResponseOfType: GitHub_SearchRepositories.self) { (response, error) in
            completion(response, error)
        }
        return request
    }
    
    // MARK: Private object methods
    
}
