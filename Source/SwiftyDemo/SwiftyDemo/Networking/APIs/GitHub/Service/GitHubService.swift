//
//  GitHubService.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 15.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation
import Moya

enum GitHubService {
    case searchRepositories(query: String)
}

extension GitHubService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .searchRepositories:
            return "/search/repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchRepositories:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .searchRepositories:
            return Data()
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .searchRepositories(let query):
            let parameters: [String : Any] = [
                "q": query
            ]
            return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    /*var validationType: ValidationType {
        switch self {
        case .searchRepositories:
            return .none
        }
    }*/
    
    var headers: [String : String]? {
        switch self {
        case .searchRepositories:
            return nil
        }
    }
}
