//
//  NewsArticle.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 19/01/25.
//

import Foundation

class NewsArticle {
    //Basic identifiable properties
    var id: UUID
    var sourceName: String?
    var author: String?
    var title: String?
    var descriptionText: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?
    
    //Initializer
    init(id: UUID,
         sourceName: String? = nil,
         author: String? = nil,
         title: String? = nil,
         descriptionText: String? = nil,
         url: String? = nil,
         urlToImage: String? = nil,
         publishedAt: Date? = nil,
         content: String? = nil
    ) {
        self.id = id
        self.sourceName = sourceName
        self.author = author
        self.title = title
        self.descriptionText = descriptionText
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}

//Mock Data for Testing and Previews
extension NewsArticle {
    static var mockNews: NewsArticle {
        NewsArticle(
            id: UUID(),
            sourceName: "TechCrunch",
            author: "John Doe",
            title: "Apple Announces New iPhone",
            descriptionText: "Apple has unveiled its latest iPhone model, featuring groundbreaking new technologies.",
            url: "https://techcrunch.com/article/apple-new-iphone",
            urlToImage: "https://techcrunch.com/images/article/iphone.png",
            publishedAt: Date(timeIntervalSinceNow: -3600), // Published 1 hour ago
            content: "Apple has just revealed its latest flagship device at their annual event..."
        )
    }
    static var mockNewsArray: [NewsArticle] {
        [
            NewsArticle(
                id: UUID(),
                sourceName: "TechCrunch",
                author: "John Doe",
                title: "Apple Announces New iPhone",
                descriptionText: "Apple has unveiled its latest iPhone model, featuring groundbreaking new technologies.",
                url: "https://techcrunch.com/article/apple-new-iphone",
                urlToImage: "https://techcrunch.com/images/article/iphone.png",
                publishedAt: Date(timeIntervalSinceNow: -3600), // Published 1 hour ago
                content: "Apple has just revealed its latest flagship device at their annual event..."
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "The Verge",
                author: "Jane Smith",
                title: "Microsoft Acquires OpenAI",
                descriptionText: "Microsoft has officially completed its acquisition of OpenAI to enhance its AI capabilities.",
                url: "https://theverge.com/article/microsoft-openai-acquisition",
                urlToImage: "https://theverge.com/images/article/microsoft-openai.png",
                publishedAt: Date(timeIntervalSinceNow: -7200), // Published 2 hours ago
                content: "In a historic move, Microsoft has acquired OpenAI to revolutionize artificial intelligence..."
            ),
            NewsArticle(
                id: UUID(),
                sourceName: "BBC News",
                author: "Michael Brown",
                title: "Global Markets Rally as Inflation Eases",
                descriptionText: "Global stock markets surged today following news that inflation rates are beginning to ease.",
                url: "https://bbc.com/news/global-markets-rally",
                urlToImage: "https://bbc.com/images/article/global-markets.png",
                publishedAt: Date(timeIntervalSinceNow: -10800), // Published 3 hours ago
                content: "Investors reacted positively today as inflation reports showed a significant reduction..."
            )
        ]
    }
}
