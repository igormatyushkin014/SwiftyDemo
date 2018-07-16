//
//  RepositoryList_GitHubRepositoryTableViewCellExtensionStyle.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

extension RepositoryList_GitHubRepositoryTableViewCell {
    
    struct Style {
        
        struct OwnerThumbnailImageView {
            
            static var contentMode: UIViewContentMode {
                get {
                    return .scaleAspectFill
                }
            }
            
            static var leftMargin: CGFloat {
                get {
                    return 16.0
                }
            }
            
            static var width: CGFloat {
                get {
                    return 44.0
                }
            }
            
            static var height: CGFloat {
                get {
                    return 44.0
                }
            }
            
        }
        
        struct RepositoryNameLabel {
            
            static var leftMargin: CGFloat {
                get {
                    return 8.0
                }
            }
            
            static var rightMargin: CGFloat {
                get {
                    return 8.0
                }
            }
            
            static var height: CGFloat {
                get {
                    return 20.0
                }
            }
            
            static var textAttributes: [NSAttributedStringKey : Any] {
                get {
                    return [
                        .font: UIFont.systemFont(ofSize: 17.0, weight: .regular),
                        .foregroundColor: UIColor.Material.Gray._900,
                        .kern: 0.5
                    ]
                }
            }
            
        }
        
        struct OwnerLoginLabel {
            
            static var topMargin: CGFloat {
                get {
                    return 4.0
                }
            }
            
            static var height: CGFloat {
                get {
                    return 15.0
                }
            }
            
            static var textAttributes: [NSAttributedStringKey : Any] {
                get {
                    return [
                        .font: UIFont.systemFont(ofSize: 12.0, weight: .regular),
                        .foregroundColor: UIColor.Material.Gray._700,
                        .kern: 0.5
                    ]
                }
            }
            
        }
        
    }
    
}
