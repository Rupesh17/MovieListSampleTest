//
//  Movie.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation


struct MovieData {
    var movies: [Movie]?
}

extension MovieData: Parsable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<MovieData, ErrorResult> {
        if let results = dictionary[kServerDataJSONKeyMovies] as? [[String: Any]] {
            let movies = results.map({ Movie(movieDict: $0)}).compactMap{$0}
            let meta = MovieData(movies: movies)
            return Result.success(meta)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse API response"))
        }
    }
}

struct Movie
{
    var title:String!
    var year:String!
    var rated:String!
    var genre:String!
    var actors:String!
    var plot:String!
    var language:String!
    var country:String!
    var poster:String!
    var releasedDate:String!
    var duration:String!
    var director:String!
    var writer:String!
    var awards:String?
    
    init?(movieDict:Dictionary<String,Any>)
    {
        guard let _ = movieDict[kServerDataJSONKeyTitle] as? String else {
            return nil
        }
        
        self.title = movieDict[kServerDataJSONKeyTitle] as! String
        self.year = movieDict[kServerDataJSONKeyYear] as? String
        self.rated = movieDict[kServerDataJSONKeyRated] as? String
        self.genre = movieDict[kServerDataJSONKeyGenre] as? String
        self.actors = movieDict[kServerDataJSONKeyActors] as? String
        self.plot = movieDict[kServerDataJSONKeyPlot] as? String
        self.language = movieDict[kServerDataJSONKeyLanguage] as? String
        self.country = movieDict[kServerDataJSONKeyCountry] as? String
        self.poster = (movieDict[kServerDataJSONKeyPoster] as? String)?.trimmingCharacters(in: .whitespaces)
        self.releasedDate = movieDict[kServerDataJSONKeyReleased] as? String
        self.duration = movieDict[kServerDataJSONKeyRuntime] as? String
        self.director = movieDict[kServerDataJSONKeyDirector] as? String
        self.writer = movieDict[kServerDataJSONKeyWriter] as? String
        self.awards = movieDict[kServerDataJSONKeyAwards] as? String
    }
}
