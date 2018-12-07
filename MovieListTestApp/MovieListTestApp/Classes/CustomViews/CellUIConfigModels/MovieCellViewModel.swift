//
//  MovieCellViewModel.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation

struct MovieCellViewModel
{
    var title:String!
    var year:String!
    var rated:String!
    var genre:String!
    var actors:String!
    var plot:String!
    var language:String!
    var country:String!
    var imageURL:String!
    var publishedDate:String!
    var duration:String!
    var director:String!
    var writer:String!
    var awards:String!
    
    init(movie:Movie)
    {
        self.title = movie.title
        self.year = movie.year
        self.rated = movie.rated
        self.genre = movie.genre
        self.actors = movie.actors
        self.plot = movie.plot
        self.language = movie.language
        self.country = movie.country
        self.imageURL = movie.poster
        self.publishedDate = movie.releasedDate
        self.duration = movie.duration
        self.director = movie.director
        self.writer = movie.writer
        self.awards = movie.awards
    }
}
