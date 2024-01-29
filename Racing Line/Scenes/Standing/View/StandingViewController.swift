//
//  StandingViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import UIKit
import SwiftUI

enum StandingSegment: String {
    case drivers = "Drivers"
    case teams = "Teams"
}

final class StandingViewController: UIViewController, UITableViewDelegate {
    
    //MARK: - Properties
    private var viewModel: StandingViewModel = StandingViewModel(networkManager: Network())
    private var driverStandings = [DriverStanding]()
    let items: [StandingSegment] = [.drivers, .teams]
    
    //MARK: - Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: items.map { ($0.rawValue) })
        control.selectedSegmentIndex = items.firstIndex(of: .drivers) ?? 0
        control.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(AppColors.background)
        setupViewModelDelegate()
        viewSetup()
        
    }
    
    //MARK: - Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadDriversData()
    }
    
    private func viewSetup() {
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        guard let selectedSegment = StandingSegment(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "") else {
            return
        }

        switch selectedSegment {
        case .drivers:
            print("Switched to Drivers")
            viewModel.loadDriversData()
        case .teams:
            print("Switched to Teams")
            viewModel.loadTeamsData()
        }
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
