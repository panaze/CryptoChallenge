//
//  NewsAPIService.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//
//

import Foundation

final class NewsAPIService {
    private let baseURL = "https://newsapi.org/v2/everything"
    private let session = URLSession.shared
    
    private var apiKey: String {
        guard let environmentKey = ProcessInfo.processInfo.environment["NEWS_API_KEY"] else {
            fatalError("NEWS_API_KEY environment variable not set")
        }
        return environmentKey
    }
    func fetchNews(for query: String) async throws -> [NewsArticle] {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let fromDate = ISO8601DateFormatter().string(from: Date().addingTimeInterval(-7 * 24 * 60 * 60))
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "searchIn", value: "title"),
            URLQueryItem(name: "from", value: fromDate),
            URLQueryItem(name: "sortBy", value: "popularity"),
            URLQueryItem(name: "pageSize", value: "5"),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }

        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
        
        // Print the entire decoded response
                print("News API Response:")
                print("Status: \(decoded.status)")
                print("Total Results: \(decoded.totalResults)")
                for article in decoded.articles {
                    print("""
                    ---
                    Source: \(article.source.name ?? "N/A")
                    Author: \(article.author ?? "N/A")
                    Title: \(article.title ?? "N/A")
                    Description: \(article.description ?? "N/A")
                    URL: \(article.url ?? "N/A")
                    Image URL: \(article.urlToImage ?? "N/A")
                    Published At: \(article.publishedAt ?? "N/A")
                    Content: \(article.content ?? "N/A")
                    """)
                }
        
        // Map to NewsArticle model
        let articles = decoded.articles.map { article -> NewsArticle in
            NewsArticle(
                sourceName: article.source.name,
                author: article.author,
                title: article.title,
                descriptionText: article.description,
                url: article.url,
                urlToImage: article.urlToImage,
                publishedAt: ISO8601DateFormatter().date(from: article.publishedAt ?? ""),
                content: article.content
            )
        }
        return articles
    }
}

private struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]

    struct Article: Decodable {
        let source: Source
        let author: String?
        let title: String?
        let description: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String?
        let content: String?
    }

    struct Source: Decodable {
        let id: String?
        let name: String?
    }
}
