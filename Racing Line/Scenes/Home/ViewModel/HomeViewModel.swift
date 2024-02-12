//
//  HomeViewModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 06.02.24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func articleInfoGot(_ data: Article)
    func showError(_ error: Error)
}

final class HomeViewModel {
    
    //MARK: - Properties
    private let networkManager: NetworkService
    weak var delegate: HomeViewModelDelegate?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func viewDidLoad() {
        loadNewsData()
    }
    
    //MARK: - Methods
    func loadNewsData() {
        let baseURL = "https://newsapi.org/v2"
        let search = "/everything?q=Formula%201&from=2024-02-05&to=2024-02-05&sortBy=popularity&"
        let APIKey = "apiKey=8671ece050cf477d972c390b8b85c539"
        let url = baseURL + search + APIKey
        
        guard let urlString = URL(string: url) else {
            return
        }
        
        networkManager.request(with: urlString) { [weak self] (result: Result<NewsResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let filteredArticles = self?.filterFormula1Articles(data.articles) ?? []
                    
                    for article in filteredArticles {
                        self?.delegate?.articleInfoGot(article)
                    }
                    
                }
            case .failure(let error):
                self?.delegate?.showError(error)
            }
        }
    }
    
    func filterFormula1Articles(_ articles: [Article]) -> [Article] {
        let keywordsToKeep = ["formula 1", "f1", "racing", "red bull", "mercedes", "ferrari", "maclaren", "fia", "hamilton", "verstappen", "sena", "alonso", "grand prix", "motorsport", "circuit", "pit stop", "qualifying", "championship", "constructor", "driver", "team principal", "podium", "pole position", "grid", "paddock", "engine", "aerodynamics", "tyres", "drs", "safety car", "dnf", "steward"]
        
        return articles.filter { article in
            let lowercasedTitle = article.title.lowercased()
            return keywordsToKeep.contains { keyword in
                lowercasedTitle.contains(keyword)
            }
        }
    }
}
