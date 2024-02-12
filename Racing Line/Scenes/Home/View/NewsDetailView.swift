//
//  NewsDetailView.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 09.02.24.
//

import SwiftUI

struct NewsDetailView: View {
    
    //MARK: - Properties
    var article: Article
    
    //MARK: - Body
    var body: some View {
        articleContentView
            .padding(.top, -20)
    }
    
    //MARK: - Components
    private var articleContentView: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 24) {
                imageView
                articleTextView
                articleSourceInfo
                
                Spacer()
            }
        }
        .background(AppColors.background)
    }
    
    private var imageView: some View {
        presentImage()
    }
    
    private var articleTextView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(article.title)
                .font(Font.system(size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.textPrimary)
            
            Text(article.description)
                .font(Font.system(size: 14))
                .fontWeight(.regular)
                .foregroundStyle(AppColors.textSecondary)
        }
        .padding(.horizontal, 20)
    }
    
    private var articleSourceInfo: some View {
        HStack(spacing: 4) {
            Text(article.source.name + " /" )
                .font(Font.system(size: 12))
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.textSecondary)
            
            Text(article.author ?? "author")
                .font(Font.system(size: 12))
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.textSecondary)
                .lineLimit(1)
            
            Spacer()
            articleDateInfo
        }
        .padding(.horizontal, 20)
    }
    
    private var articleDateInfo: some View {
        Text(article.publishedAt.prefix(10))
            .font(Font.system(size: 12))
            .fontWeight(.semibold)
            .foregroundStyle(AppColors.textPrimary)
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
            .background(AppColors.gray)
            .cornerRadius(6)
    }
    
    private func presentImage() -> some View {
        let imageURL = URL(string: article.urlToImage ?? "default")
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 320)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            },
            placeholder: {
                Image("defaultImage")
                    .resizable()
            }
        )
    }
}
