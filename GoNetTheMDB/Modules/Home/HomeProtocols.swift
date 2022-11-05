//
//  HomeProtocols.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

// MARK: ROUTER -
protocol HomeRouterProtocol: AnyObject {
    func goToHome(vc: UIViewController, movieID: Int)
}

// MARK: PRESENTER -
protocol HomePresenterProtocol: AnyObject {
    func requestMovies(url: String, mediaType: MediaType)
    func passMovieData(data: MoviesGenericResponse?, mediaType: MediaType)
    func instanceHomeView(vc: UIViewController, movieID: Int)
}

// MARK: INTERACTOR -
protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func getMovies(url: String, mediaType: MediaType)
}

// MARK:  VIEW -
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func successGetMovies(data: MoviesGenericResponse, medidaType: MediaType)
    func failGetMovies(mediaType: MediaType)
}
