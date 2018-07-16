//
//  GitHubClientTest.swift
//  SwiftyDemoTests
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Quick
import Nimble

@testable import SwiftyDemo

class GitHubClientTest: QuickSpec {
    
    override func spec() {
        let githubClient = Networking.APIs.GitHub.Client.shared
        
        describe("GitHub client") {
            it("should not be nil", closure: {
                expect(githubClient).toNot(beNil())
            })
        }
        
        describe("Repository search") {
            it("should return not nil GitHub_SearchRepositories object", closure: {
                waitUntil(timeout: Request.maximumDurationOfResponseAwaiting, action: { (done) in
                    githubClient.searchRepositories(withQuery: Content.query, completion: { (response, error) in
                        expect(response).toNot(beNil())
                        done()
                    })
                })
            })
        }
        
        describe("Repository search") {
            it("should return at least one repository", closure: {
                waitUntil(timeout: Request.maximumDurationOfResponseAwaiting, action: { (done) in
                    githubClient.searchRepositories(withQuery: Content.query, completion: { (response, error) in
                        expect(response).toNot(beNil())
                        
                        if response != nil {
                            expect(response!.items.count).toNot(equal(0))
                        }
                        
                        done()
                    })
                })
            })
        }
    }
    
}

extension GitHubClientTest {
    
    struct Content {
        
        static var query: String {
            get {
                return "swift"
            }
        }
        
    }
    
    struct Request {
        
        static var maximumDurationOfResponseAwaiting: TimeInterval {
            get {
                return 10.0
            }
        }
        
    }
    
}
