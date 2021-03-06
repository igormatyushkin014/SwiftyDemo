//
//  BaseClient.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 15.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Moya
import Result

class BaseClient<RequestTarget: TargetType> {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    init() {
        self.provider = MoyaProvider()
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var provider: MoyaProvider<RequestTarget>
    
    // MARK: Public object methods
    
    @discardableResult
    func request<MappedResponse: Decodable>(toTarget target: RequestTarget, withResponseOfType responseType: MappedResponse.Type, withCompletion completion: @escaping RequestCompletion<MappedResponse>) -> Cancellable {
        let request = self.provider.request(target) { (result) in
            switch result {
            case .success(let response):
                let mappedResponse = try? response.map(MappedResponse.self)
                completion(mappedResponse, nil)
                break
            case .failure(let error):
                completion(nil, error)
                break
            }
        }
        return request
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}

extension BaseClient {
    
    typealias RequestCompletion<MappedResponse> = (_ response: MappedResponse?, _ error: MoyaError?) -> Void
    
}
