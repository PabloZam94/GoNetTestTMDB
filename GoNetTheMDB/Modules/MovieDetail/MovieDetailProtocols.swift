//
//  MovieDetailProtocols.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

// MARK: ROUTER -
protocol MovieDetailRouterProtocol: AnyObject {
}

// MARK: PRESENTER -
protocol MovieDetailPresenterProtocol: AnyObject {
    func requestMovieDetail(url: String)
    func passMovieDetailData(data: MovieDetailResponse?)
}

// MARK: INTERACTOR -
protocol MovieDetailInteractorProtocol: AnyObject {
    var presenter: MovieDetailPresenterProtocol? { get set }
    func getMovieDetail(url: String)
}

// MARK:  VIEW -
protocol MovieDetailViewProtocol: AnyObject {
    var presenter: MovieDetailPresenterProtocol? { get set }
    func successGetMovieDetail(data: MovieDetailResponse)
    func failGetMovieDetail()
}
