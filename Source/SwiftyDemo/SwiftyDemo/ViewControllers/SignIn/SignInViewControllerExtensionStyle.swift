//
//  SignInViewControllerExtensionStyle.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 14.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit
import Pixels

extension SignInViewController {
    
    struct Style {
        
        struct SignInButton {
            
            static var borderColor: UIColor {
                get {
                    return UIColor.Material.Gray._900
                }
            }
            
            static var borderWidth: CGFloat {
                get {
                    return 1.0
                }
            }
            
            static var cornerRadius: CGFloat {
                get {
                    return 4.0
                }
            }
            
            static var titleAttributes: [NSAttributedStringKey : Any] {
                get {
                    return [
                        .font: UIFont.systemFont(ofSize: 36.0, weight: .thin),
                        .foregroundColor: UIColor.Material.Gray._900,
                        .kern: 0.5
                    ]
                }
            }
            
        }
        
    }
    
}
