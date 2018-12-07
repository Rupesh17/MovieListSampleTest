//
//  MovieViewModelTests.swift
//  MovieListTestAppTests
//
//  Created by Rupesh Kumar on 08/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

@testable import MovieListTestApp

class MovieViewModelTests: XCTestCase {
    
    var viewModel : MovieViewModel!
    var dataSource : GenericDataSource<MovieCellViewModel>!
    fileprivate var service : MockServiceHelper!
    var viewModelWithMovies : MovieViewModel!
    fileprivate var serviceWithMovie : MockServiceHelperWithMovie!
    
    
    override func setUp() {
        super.setUp()
        self.service = MockServiceHelper()
        self.serviceWithMovie = MockServiceHelperWithMovie()
        self.dataSource = GenericDataSource<MovieCellViewModel>()
        self.viewModel = MovieViewModel(service: service, dataSource: dataSource)
        self.viewModelWithMovies = MovieViewModel(service: serviceWithMovie, dataSource: dataSource)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService() {
        
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not be able to fetch movie
        viewModel.fetchMovies{ result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    
    func testFetchMovies() {
        // expected completion to succeed
        
        viewModelWithMovies.fetchMovies { result in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    
    func testFetchNoMovies() {
        
        // expected completion to fail
        viewModel.fetchMovies { result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch ")
            default:
                break
            }
        }
    }
}

fileprivate class MockServiceHelper : ServiceHelperProtocol {
    var movieData: MovieData?
    func fetchMovies(_ completion: @escaping ((Result<MovieData, ErrorResult>) -> Void)) {
        if let movieData = movieData {
            completion(Result.success(movieData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No MovieData")))
        }
    }
}

fileprivate class MockServiceHelperWithMovie : ServiceHelperProtocol {
    var movieData: MovieData? = MovieData(movies: [Movie(movieDict: ["Title":"Dummy Movie"])!])
    func fetchMovies(_ completion: @escaping ((Result<MovieData, ErrorResult>) -> Void)) {
        if let movieData = movieData {
            completion(Result.success(movieData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No MovieData")))
        }
    }
}
