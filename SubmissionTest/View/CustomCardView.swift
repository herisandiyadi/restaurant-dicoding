//
//  CustomCardView.swift
//  SubmissionTest
//
//  Created by Heri Sandiyadi on 03/07/25.
//
import SwiftUI

struct CustomCardView: View {
    let title: String
    let imageUrl: String
    let city: String
    let rating: Double
    var body: some View {
        let imageMedium = "https://restaurant-api.dicoding.dev/images/medium/\(imageUrl)"

        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.gray.opacity(0.3)) 
                .overlay(
                    AsyncImage(url: URL(string: imageMedium)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                )
                .frame(height: 140)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 8,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 0
                    )
                )
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(title)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                
                HStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color("BackgroundColor"))
                        
                        Text(city)
                            .font(.system(size: 12))
                            .foregroundColor(Color("BlackColor"))
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("YellowColor"))
                        
                        Text(String(format: "%.1f", rating))
                            .font(.system(size: 12))
                            .foregroundColor(Color("BlackColor"))
                    }
                }
                .padding(.horizontal, 16)
            }
                .padding(.vertical, 8)
        }
        .frame(height: 210)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 16, x: 0, y: 1)
    }
}
