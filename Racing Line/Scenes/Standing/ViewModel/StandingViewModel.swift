//
//  StandingViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 23.01.24.
//

import Foundation

protocol StandingViewModelDelegate: AnyObject {
    func standingInfoGot(_ data: StandingResponse)
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
                    self?.delegate?.standingInfoGot(data)
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
                    self?.delegate?.standingInfoGot(data)
                }
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
