//
//  MainViewModel.swift
//  BrowserApp
//
//  Created by Eren Erten on 18.07.2023.
//

import Foundation
import BrowserLib

protocol ViewUpdater:AnyObject{
    
    func updateOrganizationTableView()
}

class MainViewModel{
    weak var delegate:ViewUpdater?
    var apiManager = BrowserLib()
    var organizationList:[OrganizationModel] = []
    var searchResults: [OrganizationModel] = [] {
            didSet {
                delegate?.updateOrganizationTableView()
            }
        }
        
    init() {
        
        getOrganizationList()
        
    }
    
    
    func getOrganizationList(){

        apiManager.fetchData(from: .getOrganizationList) { (result: Result<[OrganizationModel], APIError>) in
            switch result {
            case .success(let organizations):
                self.organizationList = organizations
                self.searchResults = organizations
                
            case .failure(let error):
                print(error)
                // In the failure case, we should not get an error, so fail the test
            }
        }
        
        
        
    }
}
