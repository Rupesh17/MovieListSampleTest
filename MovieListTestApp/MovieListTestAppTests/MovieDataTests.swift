//
//  MovieDataTests.swift
//  MovieListTestAppTests
//
//  Created by Rupesh Kumar on 08/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

@testable import MovieListTestApp

let kSampleMovieTitle = "Avengers:Age of Ultron "
let kSampleMovieCount = 1

class MovieDataTests: XCTestCase {
    
    func testParseEmptyMovieData() {
        
        // giving empty data
        let data = Data()
        
        // giving completion after parsing
        // expected valid MovieData with   valid Movie data
        let completion : ((Result<MovieData, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testParseMovieData() {
        
        // giving a sample json file
        guard let data = FileManager.readJson(forResource: "sample") else {
            XCTAssert(false, "Can't get data from sample.json")
            return
        }
        
        // giving completion after parsing
        // expected valid converter with valid data
        let completion : ((Result<MovieData, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid movieData")
            case .success(let movieData):
                
                XCTAssertEqual(movieData.movies?.count, kSampleMovieCount, "Expected \(kSampleMovieCount)")
                XCTAssertEqual(movieData.movies?.first?.title, kSampleMovieTitle, "Expected \(kSampleMovieTitle)")
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testWrongKeyMovieData() {
        
        // giving a wrong dictionary
        let dictionary = ["test" : 123 as AnyObject]
        
        // expected to return error of MovieData
        let result = MovieData.parseObject(dictionary: dictionary)
        
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
}

extension FileManager {
    
    static func readJson(forResource fileName: String ) -> Data? {
        
        let bundle = Bundle(for: MovieDataTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        
        return nil
    }
}
