//
//  GitHubRepositoryModel.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

struct GitHubRepositoryModel: Decodable {
    var name: String
    var owner: GitHubRepositoryOwnerModel
}
