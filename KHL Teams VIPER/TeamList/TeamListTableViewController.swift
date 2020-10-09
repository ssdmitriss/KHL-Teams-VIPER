//
//  MainTableViewController.swift
//  KHL Teams
//
//  Created by Дмитрий Селезнев on 21.09.2020.
//  Copyright © 2020 Дмитрий Селезнев. All rights reserved.
//

import UIKit

protocol TeamListViewProtocol: class {
    var selfToTeamDetailsName: String { get }
    func reloadData()
}

class TeamListTableViewController: UITableViewController {
    
    var presenter: TeamListPresenterProtocol!
    var selfToTeamDetailsName: String = "showDetail"
    
    private var teams: [Team] = []
    private let configurator: TeamListConfiguratorProtocol = TeamListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar(largeTitelColor: UIColor.white,
                               backgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
                               tintColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                               title: "Команды КХЛ",
                               prefferedLargeTitle: true)
        
        if teams.isEmpty == true {
            tableView.separatorStyle = .none
        }
        
        configurator.configure(with: self)
        presenter.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        guard let team = presenter.team(atIndex: indexPath) else { return UITableViewCell() }
        cell.configureCell(with: team)
        return cell
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showTeamDetails(for: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selfToTeamDetailsName {
            guard let team = sender as? Team else { return }
            let detailVC = segue.destination as! TeamDetailsViewController
            let configurator: TeamDetailsConfiguratorProtocol = TeamDetailsConfigurator()
            configurator.configure(with: detailVC, and: team)
        }
    }
}

//MARK: - TeamListViewProtocol
extension TeamListTableViewController: TeamListViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.separatorStyle = .singleLine
        }
    }
}




extension UITableViewController{
    func configureNavigationBar(largeTitelColor: UIColor,
                                backgroundColor: UIColor,
                                tintColor: UIColor,
                                title: String,
                                prefferedLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: largeTitelColor]
            navigationBarAppearance.backgroundColor = backgroundColor
            
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.compactAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
            
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationController?.navigationBar.superview?.backgroundColor = .white
            navigationItem.title = title
            
        } else {
            // fallback on earlier virsion
            navigationController?.navigationBar.prefersLargeTitles = prefferedLargeTitle
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.tintColor = tintColor
            navigationItem.title = title
            navigationController?.view.backgroundColor = backgroundColor
        }
        
    }
}

