//
//  GitHub_SearchRepositories.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

struct GitHub_SearchRepositories: Decodable {
    var items: [GitHub_Repository]
}
