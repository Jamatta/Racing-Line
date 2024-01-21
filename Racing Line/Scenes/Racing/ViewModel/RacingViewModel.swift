//
//  RacingViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 22.01.24.
//

import UIKit

protocol RacingViewModelDelegate: AnyObject {
    func racingInfoGot(_ data: MRData)
    func showError(_ error: Error)
}

final class RacingViewModel {
    
    //MARK: - Properties
    private let networkManager: NetworkService
    weak var delegate: RacingViewModelDelegate?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func viewDidLoad(season: String) {
        getRacesBySeason(season)
    }
    
    //MARK: - Methods
    private func getRacesBySeason(_ season: String) {
        let baseURL = "https://ergast.com/api/f1/"
        let prefixURL = ".json"
        let season = season
        let url = baseURL + season + prefixURL
        
        guard let urlString = URL(string: url) else {
            return
        }
        
        networkManager.request(with: urlString) { [weak self] (result: Result<RaceResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.delegate?.racingInfoGot(data.mrData)
                }
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
