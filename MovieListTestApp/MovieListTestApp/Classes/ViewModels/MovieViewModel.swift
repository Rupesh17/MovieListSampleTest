//
//  MovieViewModel.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation
struct MovieViewModel {
    
    weak var dataSource : GenericDataSource<MovieCellViewModel>?
    weak var service: ServiceHelperProtocol?
    
    init(service: ServiceHelperProtocol = ServiceHelper.shared, dataSource : GenericDataSource<MovieCellViewModel>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchMovies(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        guard let service = service else {
            completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
            return
        }
        
        service.fetchMovies() { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let metaData) :
                    // reload data
                    var movies = metaData.movies ?? []
                    
                    // Sort Movies on the bases of date.
                    movies = movies.sorted(by: { $0.releasedDate! > $1.releasedDate! })
                    self.dataSource?.data.value = self.getMovieCellViewModelsWith(movies: movies)
                    completion?(Result.success(true))
                    
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    completion?(Result.failure(error))
                    
                    break
                }
            }
        }
    }
    
    func  getMovieCellViewModelsWith(movies:[Movie]) -> [MovieCellViewModel]
    {
        var movieCellVMList:[MovieCellViewModel] = []
        for movie in movies {
            let movieCellViewModel = MovieCellViewModel(movie: movie)
            movieCellVMList.append(movieCellViewModel)
        }
        
        return movieCellVMList
    }
}
