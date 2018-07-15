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
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    func searchRepositories(withQuery query: String, completion: @escaping RequestCompletion<[Any]>) -> Cancellable {
        let target = GitHubService.searchRepositories(query: query)
        let request = self.request(toTarget: target, withResponseOfType: GitHub_SearchRepositories.self, withCompletion: { (result) in
        })
        return request
    }
    
    // MARK: Private object methods
    
}
