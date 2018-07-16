//
//  RepositoryList_GitHubRepositoryTableViewCellExtensionContent.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

extension RepositoryList_GitHubRepositoryTableViewCell {
    
    struct Content {
        
        struct OwnerThumbnailImageView {
        }
        
        struct RepositoryNameLabel {
        }
        
        struct OwnerLoginLabel {
            
            static func text(forOwnerLogin ownerLogin: String) -> String {
                return String(
                    format: "by %@",
                    ownerLogin
                )
            }
            
        }
        
    }
    
}
