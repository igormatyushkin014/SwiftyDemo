//
//  RepositoryList_GitHubRepositoryTableViewCell.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 16.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import AlamofireImage

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
    
    fileprivate var _repository: GitHubRepositoryModel?
    
    var repository: GitHubRepositoryModel? {
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
        self.ownerThumbnailImageView = UIImageView()
        self.ownerThumbnailImageView.contentMode = Style.OwnerThumbnailImageView.contentMode
        self.addSubview(self.ownerThumbnailImageView)
    }
    
    fileprivate func initializeRepositoryNameLabel() {
        self.repositoryNameLabel = UILabel()
        self.addSubview(self.repositoryNameLabel)
    }
    
    fileprivate func initializeOwnerLoginLabel() {
        self.ownerLoginLabel = UILabel()
        self.addSubview(self.ownerLoginLabel)
    }
    
    // MARK: Configuration
    
    fileprivate func setupOwnerThumbnailImageView(withThumbnailURL thumbnailURL: String) {
        self.ownerThumbnailImageView.image = nil
        
        if let url = URL(string: thumbnailURL) {
            self.ownerThumbnailImageView.af_setImage(withURL: url)
        }
    }
    
    fileprivate func setupRepositoryNameLabel(withRepositoryName repositoryName: String) {
        let text = repositoryName
        let attributes = Style.RepositoryNameLabel.textAttributes
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        self.repositoryNameLabel.attributedText = attributedText
    }
    
    fileprivate func setupOwnerLoginLabel(withOwnerLogin ownerLogin: String) {
        let text = Content.OwnerLoginLabel.text(forOwnerLogin: ownerLogin)
        let attributes = Style.OwnerLoginLabel.textAttributes
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        self.ownerLoginLabel.attributedText = attributedText
    }
    
    // MARK: Layout
    
    fileprivate func updateUIElementsPosition() {
        self.ownerThumbnailImageView.pin
            .left()
            .marginLeft(Style.OwnerThumbnailImageView.leftMargin)
            .vCenter()
            .width(Style.OwnerThumbnailImageView.width)
            .height(Style.OwnerThumbnailImageView.height)
        
        self.repositoryNameLabel.pin
            .top(to: self.ownerThumbnailImageView.edge.top)
            .left(to: self.ownerThumbnailImageView.edge.right)
            .marginLeft(Style.RepositoryNameLabel.leftMargin)
            .right()
            .marginRight(Style.RepositoryNameLabel.rightMargin)
            .height(Style.RepositoryNameLabel.height)
        
        self.ownerLoginLabel.pin
            .top(to: self.repositoryNameLabel.edge.bottom)
            .marginTop(Style.OwnerLoginLabel.topMargin)
            .left(to: self.repositoryNameLabel.edge.left)
            .right(to: self.repositoryNameLabel.edge.right)
            .height(Style.OwnerLoginLabel.height)
    }
    
}
