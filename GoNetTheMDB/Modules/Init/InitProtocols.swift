//
//  InitProtocols.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

import UIKit

// MARK: ROUTER -
protocol InitRouterProtocol: AnyObject {
    func goToHome(vc: UIViewController) 
}

// MARK: PRESENTER -
protocol InitPresenterProtocol: AnyObject {
    func instanceNewView(vc: UIViewController)
}

// MARK: INTERACTOR -
protocol InitInteractorProtocol: AnyObject {
    var presenter: InitPresenterProtocol? { get set }
}

// MARK:  VIEW -
protocol InitViewProtocol: AnyObject {
    var presenter: InitPresenterProtocol? { get set }
}

