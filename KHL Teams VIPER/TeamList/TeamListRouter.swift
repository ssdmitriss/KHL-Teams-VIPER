//
//  TeamListRouter.swift
//  KHL Teams VIPER
//
//  Created by Дмитрий Селезнев on 01.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamListRouterProtocol: class {
    func openTeamDetailsViewController(with team: Team)
}

class TeamListRouter {
    
    weak var viewController: TeamListTableViewController!
    
    init(viewController: TeamListTableViewController) {
        self.viewController = viewController
    }
}

extension TeamListRouter: TeamListRouterProtocol {
    func openTeamDetailsViewController(with team: Team) {
        viewController.performSegue(withIdentifier: viewController.selfToTeamDetailsName, sender: team)

    }
}
