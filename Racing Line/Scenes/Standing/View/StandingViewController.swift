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
    private var teamStandings = [ConstructorStanding]()
    let items: [StandingSegment] = [.drivers, .teams]
    
    //MARK: - Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: items.map { ($0.rawValue) })
        control.selectedSegmentIndex = items.firstIndex(of: .drivers) ?? 0
        control.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(AppColors.background)
        setupViewModelDelegate()
        viewSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadDriversData()
    }
    
    //MARK: - viewSetup
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
    
    //MARK: - Methods
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
    func standingInfoGot<T>(_ data: T) {
        if let drivers = data as? [DriverStanding] {
            driverStandings = drivers
            tableView.reloadData()
        } else if let teams = data as? [ConstructorStanding] {
            print(teams.first?.constructor.name ?? "None")
            teamStandings = teams
            tableView.reloadData()
        }
    }
    
    func showError(_ error: Error) {
        print("error!")
    }
}

extension StandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case items.firstIndex(of: .drivers):
            return driverStandings.count
        case items.firstIndex(of: .teams):
            return teamStandings.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        switch segmentedControl.selectedSegmentIndex {
            
        case items.firstIndex(of: .drivers):
            let driver = driverStandings[indexPath.row]
            cell.contentConfiguration = UIHostingConfiguration(content: {
                DriverTableCellView(driverStanding: driver)
            })
        case items.firstIndex(of: .teams):
            let team = teamStandings[indexPath.row]
            cell.contentConfiguration = UIHostingConfiguration(content: {
                TeamTableCellView(teamStanding: team)
            })
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case items.firstIndex(of: .drivers):
            let driverName = driverStandings[indexPath.row].driver.familyName
            let vc = UIHostingController(rootView: DriverDetailViewController(driverName: driverName))
            navigationController?.present(vc, animated: true)
        case items.firstIndex(of: .teams):
            let teamName = teamStandings[indexPath.row].constructor.name
            let vc = UIHostingController(rootView: TeamDetailViewController(teamName: teamName))
            navigationController?.present(vc, animated: true)
        default:
            return
        }
    }
}
