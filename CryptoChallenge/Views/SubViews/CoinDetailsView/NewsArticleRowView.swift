//
//  NewsArticleRowView.swift
//  CryptoChallenge
//
//  Created by Pablo Navarro Zepeda on 20/01/25.
//
import SwiftUI

struct NewsArticleRowView: View {
    let article: NewsArticle
    
    var body: some View {
        HStack(alignment: .center, spacing: 11) {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                switch phase {
                    
                case .empty:
                    ProgressView()
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    NotAvailableView()
                }
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            .clipped()
            
            VStack(alignment: .leading){
                Text(article.title ?? "Untitled")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .padding(.top, 5)
                
                
                HStack(alignment: .center) {
                    if let sourceName = article.sourceName {
                        Text(sourceName)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Text("•")
                    
                    if let publishedAt = article.publishedAt {
                        Text("\(DateUtils.format(publishedAt))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 0) {
            ForEach(NewsArticle.mockNewsArray) { article in
                NewsArticleRowView(article: article)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                Divider()
                    .padding(.leading, 100)
            }
        }
    }
    .scrollIndicators(.hidden)
    .background(Color.gray.opacity(0.2))
    .preferredColorScheme(.dark)
}
