//
//  HomePresenter.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    
    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    private let router: HomeRouterProtocol?
    
    init(interface: HomeViewProtocol, interactor: HomeInteractorProtocol?, router: HomeRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
// PRESENTER TO INTERACTOR
    func requestMovies(url: String, mediaType: MediaType) {
        interactor?.getMovies(url: url, mediaType: mediaType)
    }
    
// PRESENTER TO VIEW
    func passMovieData(data: MoviesGenericResponse?, mediaType: MediaType) {
        DispatchQueue.main.async {
            if let safeData = data {
                self.view?.successGetMovies(data: safeData, medidaType: mediaType)
            }else{
                self.view?.failGetMovies(mediaType: mediaType)
            }
        }
    }
    
// PRESENTER TO ROUTER
    func instanceHomeView(vc: UIViewController, movieID: Int) {
        router?.goToHome(vc: vc, movieID: movieID)
    }
}
