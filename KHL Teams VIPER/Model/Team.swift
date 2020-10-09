//
//  Team.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

struct TeamInfo: Decodable{
    let id: Int?
    let division_key: String?
    let name: String?
    let conference: String?
    let location: String?
    let image: String?
    let division: String?
    let conference_key: String?
}

struct Team: Decodable {
    let team: TeamInfo?
}
