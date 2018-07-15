//
//  QueryPickerViewControllerExtensionContent.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 14.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

extension QueryPickerViewController {
    
    struct Content {
        
        struct NavigationBar {
            
            static var title: String {
                get {
                    return "Home"
                }
            }
            
        }
        
        struct SearchButton {
            
            static var title: String {
                get {
                    return "Search Repositories"
                }
            }
            
        }
        
        struct Search {
            
            static var query: String {
                get {
                    return "swift"
                }
            }
            
        }
        
    }
    
}
