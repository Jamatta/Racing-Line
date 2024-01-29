//
//  StandingViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 23.01.24.
//

import Foundation

protocol StandingViewModelDelegate: AnyObject {
    func standingInfoGot<T>(_ data: T)
    func showError(_ error: Error)
}

final class StandingViewModel {
    
    //MARK: - Properties
    private let networkManager: NetworkService
    weak var delegate: StandingViewModelDelegate?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
//    func viewDidLoad() {
//        loadDriversData()
//    }
    
    //MARK: - Methods
    func loadDriversData() {
        let baseURL = "https://ergast.com/api/f1/current/driverStandings"
        let prefixURL = ".json"
        let url = baseURL + prefixURL
        
        guard let urlString = URL(string: url) else {
            return
        }
        
        networkManager.request(with: urlString) { [weak self] (result: Result<StandingResponse, Error>) in
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    guard let driverData = data.mrData.standingsTable?.standingsLists.first?.driverStandings else {
                        return
                    }
                    self?.delegate?.standingInfoGot(driverData)
                }
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
    
    func loadTeamsData() {
        let baseURL = "https://ergast.com/api/f1/current/constructorStandings"
        let prefixURL = ".json"
        let url = baseURL + prefixURL
        
        guard let urlString = URL(string: url) else {
            return
        }
        
        networkManager.request(with: urlString) { [weak self] (result: Result<StandingResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let teamData = data.mrData.standingsTable?.standingsLists.first?.constructorStandings else {
                        return
                    }
                    self?.delegate?.standingInfoGot(teamData)
                }
                    
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
