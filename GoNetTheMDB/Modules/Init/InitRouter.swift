//
//  InitRouter.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

open class InitRouter: InitRouterProtocol {
    
// MARK: PROTOCOLS PROPERITRES -
    weak var viewController: UIViewController?
    
// MARK: STATIC FUNC -
    static public func getController() -> UIViewController {
        
       // Generating module components
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: InitViewController.self))
        let view: InitViewController = storyboard.instantiateViewController(identifier: "InitViewController") as! InitViewController
        let interactor = InitInteractor()
        let router = InitRouter()
        let presenter = InitPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
        
    func goToHome(vc: UIViewController) {
        let newViewController = HomeRouter.getController()
        vc.navigationController?.pushViewController(newViewController, animated: false)
    }
    
}
