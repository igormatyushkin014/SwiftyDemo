//
//  BaseAPI.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 15.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Alamofire

class BaseAPI {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    required init() {
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    var baseURL: String {
        get {
            return ""
        }
    }
    
    // MARK: Public object methods
    
    func absoluteURL(fromRelative relativeURL: String) -> String {
        return String(
            format: "%@%@",
            self.baseURL,
            relativeURL
        )
    }
    
    func getJSON(relativeURL: String, parameters: Parameters?, headers: HTTPHeaders?, completion: () -> Void) -> Request {
        let absoluteURL = self.absoluteURL(fromRelative: relativeURL)
        let afRequest = request(absoluteURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        afRequest.responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                // TODO: Implement handler
                break
            case .failure(let error):
                // TODO: Implement handler
                break
            }
        }
        return afRequest
    }
    
    // MARK: Private object methods
    
}
