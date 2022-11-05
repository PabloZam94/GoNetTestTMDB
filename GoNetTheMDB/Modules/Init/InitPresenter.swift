//
//  InitPresenter.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

class InitPresenter: InitPresenterProtocol {
    
// MARK: PROPERTIES -
    weak private var view: InitViewProtocol?
    var interactor: InitInteractorProtocol?
    private let router: InitRouterProtocol?
    
// MARK: INITIALIZERS -
    init(interface: InitViewProtocol, interactor: InitInteractorProtocol?, router: InitRouterProtocol ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
// MARK: FUNC -
    func instanceNewView(vc: UIViewController) {
        router?.goToHome(vc: vc)
    }
}
