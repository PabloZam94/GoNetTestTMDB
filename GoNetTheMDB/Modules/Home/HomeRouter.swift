//
//  HomeRouter.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

open class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static public func getController() -> UIViewController {
        
       // Generating module components
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle(for: HomeViewController.self))
        let view: HomeViewController = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
    func goToHome(vc: UIViewController, movieID: Int) {
        let view = MovieDetailRouter.getController(movieID: movieID)
        vc.navigationController?.pushViewController(view, animated: true)
    }
        
}

