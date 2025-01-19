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
}
