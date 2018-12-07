//
//  MovieDetailCellViewModel.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation

struct MovieDetailCellViewModel
{
    var title:String!
    var description:String?
    
    
    init(title:String, description:String?)
    {
        self.title =  title
        self.description =  description
    }
}
