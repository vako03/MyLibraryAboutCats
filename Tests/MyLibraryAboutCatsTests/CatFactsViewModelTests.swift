//
//  File.swift
//  
//
//  Created by vako on 02.05.24.
//

import XCTest
@testable import MyLibraryAboutCats

class CatFactsViewModelTests: XCTestCase {
    
    func testFetchFacts() {
        let viewModel = CatFactsViewModel()
        let expectation = self.expectation(description: "Fetching cat facts")
        
        viewModel.fetchFacts {
            XCTAssertFalse(viewModel.facts.isEmpty)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
