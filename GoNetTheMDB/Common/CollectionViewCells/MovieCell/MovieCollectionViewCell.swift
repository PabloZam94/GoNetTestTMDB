//
//  MovieCollectionViewCell.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 04/11/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

// MARK: @IBOUTLETS -
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
// MARK: SATATIC PROPERTIES -
    static let identifier = "MovieCollectionViewCell"
    
// MARK: LIFE CYCLE CELL FUNC -
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
// MARK: SETUP -
    func setupCell(data: Results) {
        movieImg.DownloadImgFromURL(uri: Endpoints.ImagePath + (data.poster_path ?? ""))
        movieImg.layer.cornerRadius = 8
    }

}
