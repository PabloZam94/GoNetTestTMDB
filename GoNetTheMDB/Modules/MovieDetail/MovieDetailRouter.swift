//
//  MovieDetailRouter.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

open class MovieDetailRouter: MovieDetailRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController(movieID: Int) -> UIViewController {
        
       // Generating module components
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: Bundle(for: MovieDetailViewController.self))
        let view: MovieDetailViewController = storyboard.instantiateViewController(identifier: "MovieDetailViewController") as! MovieDetailViewController
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        view.movieID = movieID
        
        return view
        
    }
        
}
