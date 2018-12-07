//
//  MovieDataSource.swift
//  MovieListTestAppTests
//
//  Created by Rupesh Kumar on 08/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

@testable import MovieListTestApp

class MovieDataSourceTests: XCTestCase {
    
    var dataSource : MovieDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = MovieDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        dataSource.data.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        
        // giving data value
        let dummyMovieCellVM1 = MovieCellViewModel(movie: Movie(movieDict: ["Title":"My title1"])!)
        let dummyMovieCellVM2 = MovieCellViewModel(movie: Movie(movieDict: ["Title":"My title2"])!)
        dataSource.data.value = [dummyMovieCellVM1, dummyMovieCellVM2]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    
    func testValueCell() {
        
        // giving data value
        let dummyMovieCellVM1 = MovieCellViewModel(movie: Movie(movieDict: ["Title":"My title1"])!)
        dataSource.data.value = [dummyMovieCellVM1]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: kMovieCellID)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected MovieTableViewCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? MovieTableViewCell else {
            XCTAssert(false, "Expected MovieTableViewCell class")
            return
        }
    }
}
