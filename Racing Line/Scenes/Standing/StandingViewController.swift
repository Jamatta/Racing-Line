//
//  StandingViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import UIKit
import SwiftUI

final class StandingViewController: UIViewController, UITableViewDelegate {

    private var viewModel: StandingViewModel = StandingViewModel(networkManager: Network())
    private var driverStandings = [DriverStanding]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(AppColors.background)
        setupViewModelDelegate()

        
        view.addSubview(tableView)
        tableView.pin(to: view)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewDidLoad()
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

extension StandingViewController: StandingViewModelDelegate {
    func standingInfoGot(_ data: StandingResponse) {
        
        guard let drivers = data.mrData.standingsTable?.standingsLists.first?.driverStandings else {
            return
        }
        
        driverStandings = drivers
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("error!")
    }
}

extension StandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        driverStandings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let driver = driverStandings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.contentConfiguration = UIHostingConfiguration(content: {
            DriverTableCellView(driverStanding: driver)
        })
        
        return cell
    }
}
