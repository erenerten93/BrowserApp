//
//  ViewController.swift
//  BrowserApp
//
//  Created by Eren Erten on 18.07.2023.
//

import UIKit
import BrowserLib

class MainViewController: UIViewController {
    
    private var viewModel:MainViewModel = MainViewModel()
    private var organizationListTableView:UITableView!
    private var searchController:UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    private func setUpViewController(){
        createTableView()
        createSearchController()
        setUpViewAttributes()
        activateLayout()
    }
    
    private func setUpViewAttributes(){
        viewModel.delegate = self
        view.backgroundColor = .white
        view.addSubview(organizationListTableView)
    }
    private func createSearchController(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.searchBar.tintColor = .blue
        searchController.searchBar.placeholder = "Search"
        navigationItem.titleView = searchController.searchBar
    }
    
    private func createTableView(){
        organizationListTableView = makeTableView()
        organizationListTableView.delegate = self
        organizationListTableView.dataSource = self
        organizationListTableView.register(OrganizationListTableViewCell.self,forCellReuseIdentifier: "organizationListTableViewCell")
        
    }
    
    private func activateLayout(){
        NSLayoutConstraint.activate([
            organizationListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            organizationListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  20),
            organizationListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            organizationListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)
        ])
        
    }
}
//MARK: - Extensions
extension MainViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text?.trimmingCharacters(in: .whitespaces) ?? ""
        if searchString.isEmpty {
            viewModel.searchResults = viewModel.organizationList
        } else {
            viewModel.searchResults = viewModel.organizationList.filter { item in
                return item.loginName.localizedCaseInsensitiveContains(searchString)
            }
        }
        
    }
}

extension MainViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.rowFavoriteToggled(indexOfRow: indexPath.row)
    }
    
}

extension MainViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OrganizationListTableViewCell()
        cell.assignValues(organization: viewModel.searchResults[indexPath.row])
        return cell
    }
}
extension MainViewController:ViewUpdater {
    func updateOrganizationTableView() {
        DispatchQueue.main.async {
            self.organizationListTableView.reloadData()
        }
        
    }
}
