//
//  ViewController.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

protocol TeamDetailsViewProtocol: class {
    func setTeamName(with title: String?)
    func setTeamCity(with title: String?)
    func setTeamConfirence(with title: String?)
    func setTeamLogo(with title: String?)
}

class TeamDetailsViewController: UIViewController {

    
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var logoTeam: ImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var conference: UILabel!
    
    var presenter: TeamDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    private func setupUI() {
    }
}

//MARK: - TeamDetailsViewProtocol
extension TeamDetailsViewController: TeamDetailsViewProtocol {
    func setTeamCity(with title: String?) {
        city.text = title
    }
    
    func setTeamConfirence(with title: String?) {
        conference.text = title
    }
    
    func setTeamLogo(with title: String?) {
        logoTeam.fetchImage(with: title)
    }
    
    func setTeamName(with title: String?) {
        nameTeam.text = title
    }
    
    
}
