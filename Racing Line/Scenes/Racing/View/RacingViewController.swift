//
//  RacingViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import UIKit
import SwiftUI

final class RacingViewController: UIViewController, UITableViewDelegate {
    
    //MARK: - Properties
    private var viewModel: RacingViewModel = RacingViewModel(networkManager: Network())
    private var races = [Race]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(AppColors.background)
        setupViewModelDelegate()
        
        view.addSubview(tableView)
        tableView.pin(to: view)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "raceCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewDidLoad(season: "current")
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

//MARK: - Extensions
extension RacingViewController: RacingViewModelDelegate {
    func racingInfoGot(_ data: MRData) {
        
        guard let raceData = data.raceTable else {
            return
        }
        races = raceData.races
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("error!")
    }
}

extension RacingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let race = races[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "raceCell", for: indexPath)
        
        cell.contentConfiguration = UIHostingConfiguration(content: {
            RacingTableCellView(race: race)
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let circuitName = races[indexPath.row].circuit.circuitID
        let vc = UIHostingController(rootView: CircuitDetailViewController(circuitName: circuitName))
        navigationController?.present(vc, animated: true)
    }
}
