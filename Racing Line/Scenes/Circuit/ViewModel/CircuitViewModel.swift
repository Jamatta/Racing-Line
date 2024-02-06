//
//  CircuitViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 07.02.24.
//

import UIKit

protocol CircuitViewModelDelegate: AnyObject {
    func circuitInfoGot(_ data: MRData)
    func showError(_ error: Error)
}

final class CircuitViewModel {
    
    //MARK: - Properties
    private let networkManager: NetworkService
    weak var delegate: CircuitViewModelDelegate?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func viewDidLoad() {
        getCircuitInfo()
    }
    
    //MARK: - Methods
    private func getCircuitInfo() {
        let baseURL = "https://ergast.com/api/f1/circuits"
        let prefixURL = ".json?limit=77"
        let url = baseURL + prefixURL
        
        guard let urlString = URL(string: url) else {
            return
        }
        
        networkManager.request(with: urlString) { [weak self] (result: Result<RaceResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.delegate?.circuitInfoGot(data.mrData)
                }
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
}
