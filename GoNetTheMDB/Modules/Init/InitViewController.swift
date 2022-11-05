//
//  InitViewController.swift
//  GoNetTheMDB
//
//  Created by pablo luis velazquez zamudio on 03/11/22.
//

import UIKit

class InitViewController: UIViewController, InitViewProtocol {
    
// MARK: PROTOCOL PROPERTIES -
    var presenter: InitPresenterProtocol?

// MARK: LIFE CYCLE VIEW FUNC -
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.instanceNewView(vc: self)
        }
    }
}

