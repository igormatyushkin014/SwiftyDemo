//
//  QueryPickerViewController.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 12.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import PinLayout

class QueryPickerViewController: UIViewController {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    fileprivate var signInButton: UIButton!
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI
        
        self.setupNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Update UI
        
        self.updateUIElementsPosition()
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
}

/*
 * User interface.
 */
extension QueryPickerViewController {
    
    // MARK: Initialization
    
    fileprivate func setupNavigationBar() {
        self.navigationItem.title = Content.NavigationBar.title
    }
    
    // MARK: Layout
    
    fileprivate func updateUIElementsPosition() {
    }
    
}
