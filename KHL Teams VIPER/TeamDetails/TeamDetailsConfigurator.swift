//
//  TeamDetailsConfigurator.swift
//  KHL Teams VIPER
//
//  Created by Дмитрий Селезнев on 01.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamDetailsConfiguratorProtocol: class {
    func configure(with view: TeamDetailsViewController, and team: Team)
}

class TeamDetailsConfigurator: TeamDetailsConfiguratorProtocol {
    func configure(with view: TeamDetailsViewController, and team: Team) {
        let presentor = TeamDetailsPresenter(view: view)
        let interactor = TeamDetailsInteracor(presenter: presentor, team: team)
        view.presenter = presentor
        presentor.interactor = interactor
    }
    
    
}
