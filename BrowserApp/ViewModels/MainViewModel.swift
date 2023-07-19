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
    
    var favoriteIds:[Int] = []
    
    weak var delegate:ViewUpdater?
    var apiManager = BrowserLib()
    var organizationList:[OrganizationModel] = []
    var searchResults: [OrganizationModel] = [] {
        didSet {
            delegate?.updateOrganizationTableView()
        }
    }
    
    init() {
        
        favoriteIds = UserDefaults.standard.array(forKey: "favoriteList") as? [Int] ?? []
        
        getOrganizationList()
        
    }
    
    
    deinit{
        let favoriteIds = organizationList.filter { $0.isFavorite }.map { $0.id }
        print(favoriteIds) // Output: [1, 3, 5]
        
    }
    
    func getOrganizationList(){
        
        apiManager.fetchData(from: .getOrganizationList) { [self] (result: Result<[OrganizationModel], APIError>) in
            switch result {
            case .success(let organizations):
                organizationList = organizations
                searchResults = organizations
                findFavoriteOrganization()
            case .failure(let error):
                print(error)
                // In the failure case, we should not get an error, so fail the test
            }
        }
    }
    
    func findFavoriteOrganization(){
        organizationList = organizationList.map { org in
            var updatedOrg = org
            updatedOrg.isFavorite = favoriteIds.contains(org.id)
            return updatedOrg
        }
        searchResults = organizationList
    }
    
    func rowFavoriteToggled(indexOfRow:Int){
        searchResults[indexOfRow].isFavorite.toggle()
        let idOfRow = searchResults[indexOfRow].id
        if let index = organizationList.firstIndex(where: { $0.id == idOfRow }) {
             organizationList[index].isFavorite.toggle()
         }
        if favoriteIds.contains(idOfRow){
            favoriteIds.removeAll { $0 == idOfRow }
        }
        else {
            favoriteIds.append(idOfRow)
        }
        UserDefaults.standard.set(favoriteIds, forKey: "favoriteList")
        UserDefaults.standard.synchronize()
        delegate?.updateOrganizationTableView()
    }
}
