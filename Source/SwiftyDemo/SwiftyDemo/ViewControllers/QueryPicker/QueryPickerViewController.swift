//
//  QueryPickerViewController.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 12.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Visuality
import Direct
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
    
    fileprivate var searchButton: UIButton!
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI
        
        self.initializeNavigationBar()
        self.initializeSearchButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Update UI
        
        self.updateUIElementsPosition()
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
    @objc
    internal func searchButtonDidTap() {
        let repositoryListViewController = RepositoryListViewController.from(nib: .none, inBundle: .main, loadView: true)
        repositoryListViewController.query = Content.Search.query
        Navigator.shared.performTransition(.push(viewController: repositoryListViewController, animated: true))
    }
    
}

/*
 * User interface.
 */
extension QueryPickerViewController {
    
    // MARK: Initialization
    
    fileprivate func initializeNavigationBar() {
        self.navigationItem.title = Content.NavigationBar.title
    }
    
    fileprivate func initializeSearchButton() {
        self.searchButton = UIButton(type: .system)
        
        self.searchButton.layer.borderColor = Style.SearchButton.borderColor.cgColor
        self.searchButton.layer.borderWidth = Style.SearchButton.borderWidth
        self.searchButton.layer.cornerRadius = Style.SearchButton.cornerRadius
        
        let attributedTitle = NSAttributedString(string: Content.SearchButton.title, attributes: Style.SearchButton.titleAttributes)
        self.searchButton.setAttributedTitle(attributedTitle, for: [])
        
        self.searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)
        
        self.view.addSubview(self.searchButton)
    }
    
    // MARK: Layout
    
    fileprivate func updateUIElementsPosition() {
        self.searchButton.pin
            .left(Style.SearchButton.leftMargin)
            .right(Style.SearchButton.rightMargin)
            .vCenter()
            .height(Style.SearchButton.height)
    }
    
}
