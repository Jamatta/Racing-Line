//
//  TeamDetailViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 06.02.24.
//

import Foundation

final class TeamDetailViewModel: ObservableObject {
    
    //MARK: - Properties
    private let networkManager: NetworkService
    @Published var team: TeamDetail?
    
    init(networkManager: NetworkService = Network()) {
        self.networkManager = networkManager
    }
    
    func viewDidLoad(teamName: String) {
        getTeamInfoByName(teamName)
    }
    
    private func getTeamInfoByName(_ teamName: String) {
        
        let headers = [
            "X-RapidAPI-Key": "77bd8595afmsh06e7aeb75dc0a5ep109682jsn19ace5726043",
            "X-RapidAPI-Host": "api-formula-1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api-formula-1.p.rapidapi.com/teams?search=\(teamName)")! as URL,
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
                        let teamDetailResponse = try decoder.decode(TeamResponse.self, from: data)
                        DispatchQueue.main.async {
                            guard let firstResponse = teamDetailResponse.response.first else {
                                return
                            }
                            self.team = firstResponse
                        }
                    } catch {
                        print("Decoding Error: \(error)")
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func convertToSnakeCase(name: String) -> String {
        var teamname = name.lowercased()
        teamname = teamname.replacingOccurrences(of: "racing", with: "")
        teamname = teamname.trimmingCharacters(in: .whitespaces)
        teamname = teamname.replacingOccurrences(of: " ", with: "_")
        
        return teamname
    }
}
