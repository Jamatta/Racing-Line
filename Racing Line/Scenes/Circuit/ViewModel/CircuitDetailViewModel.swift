//
//  CircuitDetailViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 03.02.24.
//

import SwiftUI

final class CircuitDetailViewModel: ObservableObject {
    
    //MARK: - Properties
    private let networkManager: NetworkService
    @Published var circuit: CircuitDetail?
    
    init(networkManager: NetworkService = Network()) {
        self.networkManager = networkManager
    }
    
    func viewDidLoad(circuitId: String) {
        getCircuitInfoById(circuitId)
    }
    
    //MARK: - Methods
    private func getCircuitInfoById(_ circuitId: String) {
        
        let headers = [
            "X-RapidAPI-Key": "77bd8595afmsh06e7aeb75dc0a5ep109682jsn19ace5726043",
            "X-RapidAPI-Host": "api-formula-1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api-formula-1.p.rapidapi.com/circuits?search=\(circuitId)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if response is HTTPURLResponse {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let circuitDetailResponse = try decoder.decode(CircuitDetailResponse.self, from: data)
                        DispatchQueue.main.async {
                            guard let firstResponse = circuitDetailResponse.response.first else {
                                return
                            }
                            self.circuit = firstResponse
                        }
                    } catch {
                        print("Decoding Error: \(error)")
                    }
                }
            }
        }
        dataTask.resume()
    }
}
