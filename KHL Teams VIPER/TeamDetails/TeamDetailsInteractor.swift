//
//  TeamDetailsInteractor.swift
//  KHL Teams VIPER
//
//  Created by Дмитрий Селезнев on 01.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamDetailsInteracorProtocol: class {
    func provideTeamDetails()
}

protocol TeamDetailsInteracorOutputProtocol: class {
    func receiveTeamDetails(teamDetailsData: TeamDetailsData)
}

class TeamDetailsInteracor {
    
    weak var presenter: TeamDetailsInteracorOutputProtocol!
    
    private var team: Team
    
    init(presenter: TeamDetailsInteracorOutputProtocol, team: Team) {
        self.presenter = presenter
        self.team = team
    }
}

extension TeamDetailsInteracor: TeamDetailsInteracorProtocol {
    func provideTeamDetails() {
        let teamDetailsData = TeamDetailsData(
            teamName: team.team?.name,
            city: team.team?.location,
            conference: team.team?.conference,
            teamLogo: team.team?.image
            )
        presenter.receiveTeamDetails(teamDetailsData: teamDetailsData)
    }
    
    
    
}
