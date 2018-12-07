//
//  GenricDataSource.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation

import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class MovieDataSource : GenericDataSource<MovieCellViewModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell configuration
        let cell = tableView.dequeueReusableCell(withIdentifier: kMovieCellID, for: indexPath) as! MovieTableViewCell
        cell.selectionStyle = .none
        cell.configCellUI()
        
        // Set cell data
        let movieCellVM = self.data.value[indexPath.row]
        cell.movieCellVM = movieCellVM
        return cell
    }
}

