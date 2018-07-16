//
//  RepositoryList_GitHubRepositoryTableViewCell.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

class RepositoryList_GitHubRepositoryTableViewCell: BaseTableViewCell {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    override class func height(withParameters parameters: Any?, andWidth width: CGFloat) -> CGFloat {
        return 60.0
    }
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.customInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInitialization()
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    fileprivate var ownerThumbnailImageView: UIImageView!
    
    fileprivate var repositoryNameLabel: UILabel!
    
    fileprivate var ownerLoginLabel: UILabel!
    
    fileprivate var _repository: GitHub_Repository?
    
    var repository: GitHub_Repository? {
        get {
            return self._repository
        }
        set {
            // Assertions for new value
            
            assert(newValue != nil, "Repository should not be nil")
            
            // Save data
            
            self._repository = newValue
            
            // Update UI
            
            self.setupOwnerThumbnailImageView(withThumbnailURL: newValue!.owner.avatar_url)
            self.setupRepositoryNameLabel(withRepositoryName: newValue!.name)
            self.setupOwnerLoginLabel(withOwnerLogin: newValue!.owner.login)
        }
    }
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    fileprivate func customInitialization() {
        // Setup UI
        
        self.initializeOwnerThumbnailImageView()
        self.initializeRepositoryNameLabel()
        self.initializeOwnerLoginLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update UI
        
        self.updateUIElementsPosition()
    }
    
    // MARK: Actions
    
}

/*
 * User interface.
 */
extension RepositoryList_GitHubRepositoryTableViewCell {
    
    // MARK: Initialization
    
    fileprivate func initializeOwnerThumbnailImageView() {
    }
    
    fileprivate func initializeRepositoryNameLabel() {
    }
    
    fileprivate func initializeOwnerLoginLabel() {
    }
    
    // MARK: Configuration
    
    fileprivate func setupOwnerThumbnailImageView(withThumbnailURL thumbnailURL: String) {
    }
    
    fileprivate func setupRepositoryNameLabel(withRepositoryName repositoryName: String) {
    }
    
    fileprivate func setupOwnerLoginLabel(withOwnerLogin ownerLogin: String) {
    }
    
    // MARK: Layout
    
    fileprivate func updateUIElementsPosition() {
    }
    
}
