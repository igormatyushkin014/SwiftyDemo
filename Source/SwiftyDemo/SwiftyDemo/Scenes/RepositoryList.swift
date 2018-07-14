//
//  RepositoryList.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 13.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation
import Visuality
import Direct

extension Scene {
    
    static var repositoryList: Scene {
        get {
            let repositoryListViewController = RepositoryListViewController.from(nib: .none, inBundle: .main)
            let navigationController = UINavigationController(rootViewController: repositoryListViewController)
            return Scene(rootController: navigationController)
        }
    }
    
}
