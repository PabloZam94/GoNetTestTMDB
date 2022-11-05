//
//  MovieDetailInteractor.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

class MovieDetailInteractor: MovieDetailInteractorProtocol {

// MARK: PROTOCOL PROPERTIES -
    weak var presenter: MovieDetailPresenterProtocol?
    
// MARK: GET METHOD FUNC -
    func getMovieDetail(url: String) {
        NetworkManager().getMovieDetail(url: url) { data in
            self.presenter?.passMovieDetailData(data: data)
        }
    }
}
