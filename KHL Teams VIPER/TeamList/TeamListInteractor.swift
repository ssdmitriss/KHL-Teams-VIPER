//
//  TeamListInteractor.swift
//  KHL Teams VIPER
//
//  Created by Дмитрий Селезнев on 01.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamListInteractorProtocol: class {
    func fetchTeams()
}

protocol TeamListInteractorOutputProtocol: class {
    func teamsDidReseive(_ teams: [Team])
}

class TeamListInteractor {
    
    weak var presenter: TeamListInteractorOutputProtocol!
    
    init(presenter: TeamListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension TeamListInteractor: TeamListInteractorProtocol {
    func fetchTeams() {
        NetworkManager.shared.fetchData { [weak self] teams in
            self?.presenter.teamsDidReseive(teams)
        }
    }
    
    
}
