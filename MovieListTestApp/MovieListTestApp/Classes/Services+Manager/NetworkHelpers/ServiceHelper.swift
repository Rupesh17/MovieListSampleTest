//
//  ServiceHelper.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation

protocol ServiceHelperProtocol : class {
    func fetchMovies(_ completion: @escaping ((Result<MovieData, ErrorResult>) -> Void))
}

//MARK:- Service enums
enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

final class ServiceHelper : RequestHandler, ServiceHelperProtocol {
    
    static let shared = ServiceHelper()
    
    let apiUrlStr = API_BASE_URL
    var task : URLSessionTask?
    
    func fetchMovies(_ completion: @escaping ((Result<MovieData, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchMovies()
        task = RequestService().loadData(urlString: apiUrlStr, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchMovies() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
