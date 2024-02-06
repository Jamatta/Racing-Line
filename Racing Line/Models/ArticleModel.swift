//
//  ArticleModel.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 06.02.24.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String
}
