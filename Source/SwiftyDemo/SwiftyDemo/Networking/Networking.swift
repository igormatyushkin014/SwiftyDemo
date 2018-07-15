//
//  Networking.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 15.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

struct Networking {
    
    struct APIs {
        
        struct GitHub {
            
            typealias Service = GitHubService
            
            typealias Client = GitHubClient
            
            struct Models {
                
                typealias SearchRepositories = GitHub_SearchRepositories
                
                typealias Repository = GitHub_Repository
                
                typealias RepositoryOwner = GitHub_RepositoryOwner
                
            }
            
        }
        
    }
    
}
