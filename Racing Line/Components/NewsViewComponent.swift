//
//  NewsViewComponent.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 06.02.24.
//

import SwiftUI

struct NewsViewComponent: View {
    
    let article: Article
    
    var body: some View {
        
        HStack(spacing: 12) {
            imageView
            articleInfo
        }
        .padding(12)
        .background(AppColors.background)
        .cornerRadius(6)
    }
    
    private var imageView: some View {
        presentImage()
    }
    
    private var articleInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(article.title)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .font(Font.system(size: 14))
                .fontWeight(.medium)
                .foregroundStyle(AppColors.textPrimary)
            
            Text(article.description)
                .lineLimit(3)
                .font(Font.system(size: 13))
                .fontWeight(.regular)
                .foregroundStyle(AppColors.textSecondary)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func presentImage() -> some View {
        let imageURL = URL(string: article.urlToImage ?? "default")
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 88)
                    .clipped()
                    .cornerRadius(2)
                
            }, placeholder: {
                Image("defaultImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 100)
                    .clipped()
                    .cornerRadius(2)
            })
    }
}

