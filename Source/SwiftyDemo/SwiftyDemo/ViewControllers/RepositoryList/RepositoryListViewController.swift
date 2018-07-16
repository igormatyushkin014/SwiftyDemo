//
//  RepositoryListViewController.swift
//  SwiftyDemo
//
//  Created by Igor Matyushkin on 12.07.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Moya
import PinLayout

class RepositoryListViewController: UIViewController {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
        self.cancelCurrentRequest()
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    fileprivate var activityIndicatorView: UIActivityIndicatorView!
    
    fileprivate var tableView: UITableView!
    
    fileprivate var tableViewStore: TableView.Store!
    
    fileprivate var _query: String?
    
    var query: String? {
        get {
            return self._query
        }
        set {
            // Assertions for new value
            
            assert(newValue != nil, "Query should not be nil")
            
            // Save data
            
            self._query = newValue
            
            // Cancel current request
            
            self.cancelCurrentRequest()
            
            // Prepare UI for next request
            
            self.prepareForRequest()
            
            // Handle query
            
            self.lastRequest = Networking.APIs.GitHub.Client.shared.searchRepositories(withQuery: query!) { (response, error) in
                self.handleResponse(with: response)
            }
        }
    }
    
    fileprivate var lastRequest: Cancellable?
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup data
        
        self.setupTableViewStore()
        
        // Setup UI
        
        self.initializeNavigationBar()
        self.initializeTableView()
        self.initializeActivityIndicatorView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Update UI
        
        self.updateUIElementsPosition()
    }
    
    // MARK: Private object methods
    
    fileprivate func prepareForRequest() {
        // Update activity indicator view
        
        self.activityIndicatorView.startAnimating()
    }
    
    fileprivate func handleResponse(with searchResults: GitHubSearchRepositoriesModel?) {
        // Update activity indicator view
        
        self.activityIndicatorView.stopAnimating()
        
        // Update table view
        
        self.tableViewStore = searchResults == nil ? TableView.Store(sections: []) : TableView.Store.from(searchResults!)
        self.tableView.reloadData()
    }
    
    fileprivate func cancelCurrentRequest() {
        if self.lastRequest != nil {
            self.lastRequest!.cancel()
            self.lastRequest = nil
        }
    }
    
    // MARK: Actions
    
}

/*
 * Data.
 */
extension RepositoryListViewController {
    
    // MARK: Initialization
    
    fileprivate func setupTableViewStore() {
        self.tableViewStore = TableView.Store(sections: [])
    }
    
}

/*
 * User interface.
 */
extension RepositoryListViewController {
    
    // MARK: Initialization
    
    fileprivate func initializeNavigationBar() {
        self.navigationItem.title = Content.NavigationBar.title
    }
    
    fileprivate func initializeTableView() {
        self.tableView = UITableView(frame: .zero, style: .grouped)
        
        self.tableView.register(
            RepositoryList_GitHubRepositoryTableViewCell.self,
            forCellReuseIdentifier: RepositoryList_GitHubRepositoryTableViewCell.reuseIdentifier()
        )
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.view.addSubview(self.tableView)
    }
    
    fileprivate func initializeActivityIndicatorView() {
        self.activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.activityIndicatorView.hidesWhenStopped = true
        self.activityIndicatorView.stopAnimating()
        self.view.addSubview(self.activityIndicatorView)
    }
    
    // MARK: Layout
    
    fileprivate func updateUIElementsPosition() {
        self.tableView.pin
            .top(self.view.pin.safeArea)
            .left(self.view.pin.safeArea)
            .right(self.view.pin.safeArea)
            .bottom(self.view.pin.safeArea)
        
        self.activityIndicatorView.pin
            .center()
    }
    
}

/*
 * Table view's data source and delegate implementation.
 */
extension RepositoryListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewStore.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewStore.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let githubRepository = self.tableViewStore.sections[indexPath.section].items[indexPath.row].githubRepository
        
        let reuseIdentifier = RepositoryList_GitHubRepositoryTableViewCell.reuseIdentifier()
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! RepositoryList_GitHubRepositoryTableViewCell
        cell.repository = githubRepository
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RepositoryList_GitHubRepositoryTableViewCell.height(withParameters: nil, andWidth: .leastNonzeroMagnitude)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension RepositoryListViewController {
    
    struct TableView {
        
        struct Item {
            var githubRepository: GitHubRepositoryModel
        }
        
        struct Section {
            var items: [Item]
        }
        
        struct Store {
            var sections: [Section]
            
            static func from(_ searchResult: GitHubSearchRepositoriesModel) -> Store {
                return Store(
                    sections: [
                        Section(
                            items: searchResult.items.map({ (githubRepository) -> Item in
                                return Item(githubRepository: githubRepository)
                            })
                        )
                    ]
                )
            }
        }
        
    }
    
}
