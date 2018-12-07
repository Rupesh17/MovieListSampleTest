//
//  MovieTableViewCell.swift
//  MovieListTestApp
//
//  Created by Rupesh Kumar on 07/12/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var yearLabel:UILabel!
    @IBOutlet weak var langugaeLabel:UILabel!
    @IBOutlet weak var movieIcon:UIImageView!

    var movieCellVM : MovieCellViewModel? {
        didSet {
            
            guard let movieCellVM = movieCellVM else {
                return
            }
            
            titleLabel?.text = movieCellVM.title
            yearLabel?.text = "\(kDurationText) : \(movieCellVM.duration!)"
            langugaeLabel?.text = movieCellVM.language

            if let urlStr = movieCellVM.imageURL {
                let url = URL(string: urlStr)
                //Image Cache using SDWebImage
                movieIcon.sd_setShowActivityIndicatorView(true)
                movieIcon.sd_setIndicatorStyle(.gray)
                movieIcon.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCellUI() {
        self.titleLabel?.textColor = kPrimaryTextColor
        self.yearLabel?.textColor = kSecondryTextColor
        self.langugaeLabel?.textColor = kSecondryTextColor
    }
}
