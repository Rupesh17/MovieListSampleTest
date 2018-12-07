//
//  ServiceHelperTests.swift
//  MovieListTestAppTests
//
//  Created by Rupesh Kumar on 08/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

@testable import MovieListTestApp

class ServiceHelperTests: XCTestCase {
    
    func testCancelRequest() {
        
        // giving a "previous" session
        ServiceHelper.shared.fetchMovies { (_) in
            // ignore call
        }
        
        // Expected to task nil after cancel
        ServiceHelper.shared.cancelFetchMovies()
        XCTAssertNil(ServiceHelper.shared.task, "Expected task nil")
    }
}
