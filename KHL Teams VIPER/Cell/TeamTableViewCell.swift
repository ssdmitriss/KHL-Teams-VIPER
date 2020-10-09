//
//  TeamTableViewCell.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamLogo: ImageView!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var cityTeam: UILabel!
    @IBOutlet weak var divisionTeam: UILabel!
    
    func configureCell(with team: Team) {
        nameTeam.text = team.team?.name
        cityTeam.text = team.team?.location
        divisionTeam.text = team.team?.division
        teamLogo.fetchImage(with: team.team?.image)
    }
    
}
