//
//  TeamListPresenter.swift
//  KHL Teams VIPER
//
//  Created by Дмитрий Селезнев on 01.10.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

protocol TeamListPresenterProtocol: class {
    var teams: [Team] { get }
    var teamsCount: Int? { get }
    func viewDidLoad()
    func team(atIndex indexPath: IndexPath) -> Team?
    func showTeamDetails(for indexPath: IndexPath)
}

class TeamListPresenter {
    
    weak var view: TeamListViewProtocol!
    var interactor: TeamListInteractorProtocol!
    var router: TeamListRouterProtocol!
    var teams: [Team] = []
    var teamsCount: Int? {
        teams.count
    }
    
    required init(view: TeamListViewProtocol) {
        self.view = view
    }
}

extension TeamListPresenter: TeamListPresenterProtocol {
    func viewDidLoad() {
        interactor.fetchTeams()
    }
    
    func team(atIndex indexPath: IndexPath) -> Team? {
        if teams.indices.contains(indexPath.row) {
            return teams[indexPath.row]
        } else {
            return nil
        }
    }
    
    func showTeamDetails(for indexPath: IndexPath) {
        if teams.indices.contains(indexPath.row) {
            let team = teams[indexPath.row]
            router.openTeamDetailsViewController(with: team)
        }
    }
   
}

extension TeamListPresenter: TeamListInteractorOutputProtocol {
    func teamsDidReseive(_ teams: [Team]) {
        self.teams = teams
        view.reloadData()
    }
    
    
}
