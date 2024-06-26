import XCTest
@testable import MyLibraryAboutCats

class CatFactsAPITests: XCTestCase {
    
    func testFetchFacts() {
        let expectation = self.expectation(description: "Fetching cat facts")
        
        CatFactsAPI.shared.fetchFacts { facts, error in
            XCTAssertNotNil(facts)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
