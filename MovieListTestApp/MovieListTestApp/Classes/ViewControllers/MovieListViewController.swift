//
//  MovieListViewController.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 06/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import UIKit

let kEstimatedMovieRableRowHeight:CGFloat = 100.0

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var movieTableView:UITableView!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    
    var dataSource = MovieDataSource()
    
    lazy var viewModel : MovieViewModel = {
        let viewModel = MovieViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpIntials()
    }
    
    //MARK:- UI setu methods
    
    func setUpIntials() {
        
        //Setup UI
        self.title = kMovieTitleString
        self.activityIndicator.stopAnimating()
        
        self.movieTableView.rowHeight = UITableViewAutomaticDimension
        self.movieTableView.estimatedRowHeight = kEstimatedMovieRableRowHeight
        
        //Setup datasource
        self.movieTableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.movieTableView.reloadData()
        }
        
        // Fetch movie if network available
        Utils.isConnectedToNetwork() ? fetchMovie() : showAlertWithMessgae(message: kNoNetworkErrorMessgae)
    }
    
    func fetchMovie()
    {
        self.activityIndicator.startAnimating()
        self.viewModel.fetchMovies({[weak self] result in
            
            self?.activityIndicator.stopAnimating()
            
            switch result{
            case .failure(let error):
                self?.showAlertWithMessgae(message: error.localizedDescription)
                
            default:
                NSLog("sucess")
            }
        })
    }
    
    //MARK:- Alert
    func showAlertWithMessgae(message:String) {
        
        let alertView = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        let action = UIAlertAction(title: kOkButtonTitle, style: .default, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
}

//MARK:- Extension for TableViewDelegate handling
extension MovieListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: kMovieDetailSegue, sender: self.dataSource.data.value[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kMovieDetailSegue {
            let movieDetailVC = segue.destination as? MovieDetailViewController
            movieDetailVC?.movieItem = sender as! MovieCellViewModel
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
}
