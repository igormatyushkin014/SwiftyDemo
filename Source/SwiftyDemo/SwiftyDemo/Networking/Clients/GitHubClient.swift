//
//  GitHubClient.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 15.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Moya
import Result

class GitHubClient: BaseClient {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    func searchRepositories(withQuery query: String, completion: @escaping RequestCompletion<[Any]>) {
        let target = Networking.Services.GitHub.searchRepositories(query: query)
        MoyaProvider<Networking.Services.GitHub>().request(target) { (result) in
            switch result {
            case .success:
                let repositories = [Any]()
                // TODO: Implement mapping
                completion(.success(repositories))
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
    
    // MARK: Private object methods
    
}

extension Networking.Clients {
    
    typealias GitHub = GitHubClient
    
}
