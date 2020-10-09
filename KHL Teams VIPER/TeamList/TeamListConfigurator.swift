//
//  TeamListConfigurator.swift
//  KHL Teams VIPER
//
//  Created by Дмитрий Селезнев on 01.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamListConfiguratorProtocol: class {
    func configure(with viewController: TeamListTableViewController)
}

class TeamListConfigurator: TeamListConfiguratorProtocol {
    func configure(with viewController: TeamListTableViewController) {
        let presenter = TeamListPresenter(view: viewController)
        let interactor = TeamListInteractor(presenter: presenter)
        let router = TeamListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
