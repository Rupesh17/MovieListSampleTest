//
//  Constants.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation
import UIKit

//MARK: API response keys

let kServerDataJSONKeyTitle:String  = "Title"
let kServerDataJSONKeyYear:String  = "Year"
let kServerDataJSONKeyRated:String  = "Rated"
let kServerDataJSONKeyGenre:String  = "Genre"
let kServerDataJSONKeyActors:String  = "Actors"
let kServerDataJSONKeyPlot:String  = "Plot"
let kServerDataJSONKeyLanguage:String  = "Language"
let kServerDataJSONKeyCountry:String  = "Country"
let kServerDataJSONKeyPoster:String  = "Poster "
let kServerDataJSONKeyReleased:String  = "Released"
let kServerDataJSONKeyRuntime:String  = "Runtime"
let kServerDataJSONKeyWriter:String  = "Writer"
let kServerDataJSONKeyAwards:String  = "Awards"
let kServerDataJSONKeyDirector:String  = "Director"
let kServerDataJSONKeyMovies:String  = "movies"

//MARK: API URLS
let API_BASE_URL: String = "https://api.myjson.com/bins/18buhu"

//MARK: Storyboard ID's
let kMovieCellID = "MovieCellID"
let kMovieDetailSegue = "movieDetailsSegue"
let kMovieDetailCellID = "DetailCellID"

//MARK: Color constants
let kPrimaryTextColor = UIColor.black
let kSecondryTextColor = UIColor.darkGray
let kPrimaryBackGroundColor = UIColor.lightGray

//MARK: UI String constants
let kMovieTitleString = "Movies"
let kOkButtonTitle = "OK"

let kDurationText = "Duration"
let kNameText = "Name"
let kLanguagesText = "Language's"
let kActorsText = "Actor's"
let kDirectedByText = "Directed by"
let kWrittenByText = "Written by"
let kGenreText = "Genre's"
let kReleasedYearText = "Released in"
let kRatingText = "Rating"
let kPlotText = "Plot"
let kCountryText = "Country"
let kReleasedDateText = "Released on"
let kAwardsText = "Award's"

let kNoNetworkErrorMessgae = "Internet is not availble. please check your internet setting and try again."
let kNetworkErrorMessgae = "Network error occurred!. Please check your internet and try again."
let kAPIParseErrorMessgae = "An error occurred while processing response!. Please check your internet setting and try again later"

