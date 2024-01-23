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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelDelegate()
        viewModel.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
}

extension StandingViewController: StandingViewModelDelegate {
    func standingInfoGot(_ data: StandingResponse) {
        let drivers = data.mrData.standingsTable?.standingsLists.first?.driverStandings
        driverStandings = drivers!
    }
    
    func showError(_ error: Error) {
        print("error!")
    }
}
