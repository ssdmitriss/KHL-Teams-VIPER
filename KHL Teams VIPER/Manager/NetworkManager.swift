//
//  NetworkManager.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 25.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let teamsURL = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"
    
    func fetchData(completion: @escaping (_ teams: [Team]) -> ()) {
        guard let url = URL(string: teamsURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let teams = try JSONDecoder().decode([Team].self, from: data)
                completion(teams)
            } catch let error {
                print(error)
            }
        } .resume()
    }
}
