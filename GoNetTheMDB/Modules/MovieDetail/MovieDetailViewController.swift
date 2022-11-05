//
//  MovieDetailViewController.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var mainContainerView: UIView!
    
    @IBOutlet weak var btnBack: UIButton!
    // Img Container
    @IBOutlet weak var imgConainerView: UIView!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var yearTagView: UIView!
    @IBOutlet weak var lblTagDate: UILabel!
    @IBOutlet weak var lenguegeTagView: UIView!
    @IBOutlet weak var lblTagLenguage: UILabel!
    @IBOutlet weak var starTagView: UIView!
    @IBOutlet weak var lblRate: UILabel!
    
    // Overview section
    @IBOutlet weak var overviewContainer: UIView!
    @IBOutlet weak var lblTitleOverview: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
   
    
    // MARK: PROTOCOL PROPERTIES -
    var presenter: MovieDetailPresenterProtocol?
    
// MARK: PROPERTIES -
    var movieID = 0
    
// MARK: LIFE CYCLE VIEW FUNC -
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        self.presenter?.requestMovieDetail(url: Endpoints.BaseURL + Endpoints.movie + "\(movieID)?" + Endpoints.apiKey + "&language=en-US")

    }
    
// MARK: FUNC -
    func initUI() {
        yearTagView.layer.cornerRadius = 4
        lenguegeTagView.layer.cornerRadius = 4
        starTagView.layer.cornerRadius = 4
    }
    
    func fillData(data: MovieDetailResponse) {
        lblMovieTitle.text = data.title
        movieImg.DownloadImgFromURL(uri: Endpoints.ImagePath + (data.poster_path ?? ""))
        lblOverview.text = data.overview
        var arrayGenres = [String]()
        let genres = data.genres
        genres?.forEach({ genre in
            arrayGenres.append(genre.name ?? "")
        })
        
        let strJoinedArray = arrayGenres.joined(separator: " • ")
        lblGenres.text = strJoinedArray
        
        let yearArray = data.release_date?.split(separator: "-")
        if yearArray?.count != 0 {
            let year = yearArray?[0]
            lblTagDate.text = "\(year ?? "")"
        }
        lblTagLenguage.text = data.original_language
        lblRate.text = "\(data.vote_average ?? 0.0)"
        
    }
    
// MARK: @IBACTIONS -
    @IBAction func BackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: EXTENSIONS -
extension MovieDetailViewController: MovieDetailViewProtocol {
    func successGetMovieDetail(data: MovieDetailResponse) {
        fillData(data: data)
    }
    
    func failGetMovieDetail() {
        print("fail")
    }
    
}
