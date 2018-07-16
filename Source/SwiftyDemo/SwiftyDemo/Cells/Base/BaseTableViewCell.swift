//
//  BaseTableViewCell.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    class func reuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
    
    class func height(withParameters parameters: Any?, andWidth width: CGFloat) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Actions
    
}
