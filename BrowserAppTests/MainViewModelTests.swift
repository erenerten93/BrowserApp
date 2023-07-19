//
//  MainViewModelTests.swift
//  BrowserAppTests
//
//  Created by Eren Erten on 19.07.2023.
//

import XCTest
@testable import BrowserApp

final class MainViewModelTests: XCTestCase {
    
    var viewModel: MainViewModel!
    override func setUpWithError() throws {
        // Initialize the ViewModel with the mock API manager
        viewModel = MainViewModel()
    }
    
    func testRowFavoriteToggled() {
            let mockOrganizationList: [OrganizationModel] = [
                OrganizationModel(loginName: "Org1", id: 0, repoURL: "https://api.github.com/org1/repos", avatarURL: URL(string: "https://example.com/org1/avatar")!, description: "Description 1", isFavorite: false),
                OrganizationModel(loginName: "Org2", id: 1, repoURL: "https://api.github.com/org2/repos", avatarURL: URL(string: "https://example.com/org2/avatar")!, description: "Description 2", isFavorite: false),
            ]

            viewModel.searchResults = mockOrganizationList
            // Add to favorite
            viewModel.rowFavoriteToggled(indexOfRow: 1)
            XCTAssertTrue(viewModel.searchResults[1].isFavorite)
            XCTAssertTrue(viewModel.favoriteIds.contains(1))
            // Delete from favorite
            viewModel.rowFavoriteToggled(indexOfRow: 1)
            XCTAssertFalse(viewModel.searchResults[1].isFavorite)
            XCTAssertFalse(viewModel.favoriteIds.contains(1))
        }


}
