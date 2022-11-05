//
//  MovieDetailPresenter.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak private var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    private let router: MovieDetailRouterProtocol?
    
    init(interface: MovieDetailViewProtocol, interactor: MovieDetailInteractorProtocol?, router: MovieDetailRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
// PRESENTER TO INTERACTOR
    func requestMovieDetail(url: String) {
        interactor?.getMovieDetail(url: url)
    }
    
// PRESENTER TO VIEW
    func passMovieDetailData(data: MovieDetailResponse?) {
        DispatchQueue.main.async {
            if let safeData = data {
                self.view?.successGetMovieDetail(data: safeData)
            }else{
                self.view?.failGetMovieDetail()
            }
        }
    }
    
}
