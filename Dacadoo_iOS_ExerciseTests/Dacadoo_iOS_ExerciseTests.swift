//
//  Dacadoo_iOS_ExerciseTests.swift
//  Dacadoo_iOS_ExerciseTests
//
//  Created by Angelos Staboulis on 17/5/24.
//

import XCTest
@testable import Dacadoo_iOS_Exercise

final class Dacadoo_iOS_ExerciseTests: XCTestCase {
    let viewModel = PhotoViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
            let expectation = expectation(description: "Loading Photos")
            viewModel.getAllPhotos(urlString: "https://api.unsplash.com/search/photos?query=\("trixes")&client_id=NHr5nmnvy4fJA0AtfpReQm_EI2SBnnvPajDObRtmYbY") { urlsArray in
                defer{
                    expectation.fulfill()
                }
                if urlsArray.count == 0
                {
                    XCTFail("Fail to fetch data")
                }
                // The request is finished, so our expectation
            }
            waitForExpectations(timeout: 30)

        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
