//
//  ViewController.swift
//  BrowserApp
//
//  Created by Eren Erten on 18.07.2023.
//

import UIKit
import BrowserLib

class MainViewController: UIViewController {

    var viewModel:MainViewModel = MainViewModel()
    
    // TableView
    private var organizationListTableView:UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)

    
        override func viewDidLoad() {
        super.viewDidLoad()
            
      
            
            viewModel.delegate = self
            
            
            organizationListTableView = makeTableView()
            organizationListTableView.dataSource = self
            organizationListTableView.register(OrganizationListTableViewCell.self,forCellReuseIdentifier: "organizationListTableViewCell")
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.searchResultsUpdater = self
            definesPresentationContext = true
            searchController.searchBar.tintColor = .blue
            searchController.searchBar.placeholder = "Search"
            navigationItem.titleView = searchController.searchBar
 
            view.backgroundColor = .white
            view.addSubview(organizationListTableView)
        // Do any additional setup after loading the view.
            
            organizationListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
            organizationListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:  20).isActive = true
            organizationListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
            organizationListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive = true
    }
}

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
