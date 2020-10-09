//
//  TeamDetailsPresenter.swift
//  KHL Teams VIPER
//
//  Created by Дмитрий Селезнев on 01.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

struct TeamDetailsData {
    let teamName: String?
    let city: String?
    let conference: String?
    let teamLogo: String?
    
}

protocol TeamDetailsPresenterProtocol: class {
    func showDetails()
}

class TeamDetailsPresenter {
    
    weak var view: TeamDetailsViewProtocol!
    var interactor: TeamDetailsInteracorProtocol!
    
    required init(view: TeamDetailsViewProtocol){
        self.view = view
    }
}

extension TeamDetailsPresenter: TeamDetailsPresenterProtocol {
    func showDetails() {
        interactor.provideTeamDetails()
        
    }
}

extension TeamDetailsPresenter: TeamDetailsInteracorOutputProtocol {
    func receiveTeamDetails(teamDetailsData: TeamDetailsData) {
        view.setTeamName(with: teamDetailsData.teamName)
        view.setTeamCity(with: teamDetailsData.city)
        view.setTeamConfirence(with: teamDetailsData.conference)
        view.setTeamLogo(with: teamDetailsData.teamLogo)
    }
    
    
}
