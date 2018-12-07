//
//  MovieDetailViewController.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailViewController : UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var detailTableView:UITableView!
    
    var movieDetails = [MovieDetailCellViewModel]()
    var movieItem:MovieCellViewModel!
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.detailTableView.estimatedRowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
    }
    
    // MARK:- Priavate setup funcations
    
    func initialSetUp()  {
        setUpTableData()
        setUpTableHeaderView()
    }
    
    func setUpTableData() {
        
        var movieDetailViewModel = MovieDetailCellViewModel(title: kServerDataJSONKeyTitle, description: self.movieItem.title)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kLanguagesText, description: self.movieItem.language)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kRatingText, description: self.movieItem.rated)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kGenreText, description: self.movieItem.genre)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kPlotText, description: self.movieItem.plot)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kActorsText, description: self.movieItem.actors)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kWrittenByText, description: self.movieItem.writer)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kDirectedByText, description: self.movieItem.director)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kAwardsText, description: self.movieItem.awards)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kCountryText, description: self.movieItem.country)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kReleasedYearText, description: self.movieItem.year)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kDurationText, description: self.movieItem.duration)
        movieDetails.append(movieDetailViewModel)
        
        movieDetailViewModel = MovieDetailCellViewModel(title: kReleasedDateText, description: self.movieItem.publishedDate)
        movieDetails.append(movieDetailViewModel)
    }
    
    func setUpTableHeaderView() {
        let headerView: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 400))
        let imageView: UIImageView = UIImageView.init(frame:  CGRect.init(x: 50, y: 50, width: self.view.frame.width-100, height: 300))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        headerView.addSubview(imageView);
        self.detailTableView.tableHeaderView = headerView;
        
        if let urlStr = self.movieItem.imageURL {
            let url = URL(string: urlStr)
            //Image Cache using SDWebImage
            imageView.sd_setShowActivityIndicatorView(true)
            imageView.sd_setIndicatorStyle(.gray)
            imageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
        }
    }
    
    //MARK:- Table Data Source and Delegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :MovieDetailTableViewCell  = (detailTableView.dequeueReusableCell(withIdentifier: kMovieDetailCellID) as? MovieDetailTableViewCell)!
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let movieDetailCellViewModel = self.movieDetails[indexPath.row]
        cell.titleLabel?.text = movieDetailCellViewModel.title
        cell.valueLabel?.text = movieDetailCellViewModel.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieDetails.count;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
