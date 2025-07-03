//
//  DetailRestaurantView.swift
//  SubmissionTest
//
//  Created by Heri Sandiyadi on 03/07/25.
//

import SwiftUI

struct DetailRestaurantView: View {
    let restaurant: Restaurant
   

    
    var body: some View {
        let imageMedium = "https://restaurant-api.dicoding.dev/images/medium/\(restaurant.pictureId)"
        VStack(spacing: 0) {
            HStack {
                Text(restaurant.name)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                
                
            }
            .padding(16)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
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
                        .frame(height: 240)
                        .clipShape(
                            UnevenRoundedRectangle(
                                topLeadingRadius: 8,
                                bottomLeadingRadius: 8,
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 8
                            )
                        )
                    HStack{
                        HStack(spacing: 4) {
                            HStack(spacing: 4) {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(Color("BackgroundColor")).frame(height:14)
                                
                                Text(restaurant.city)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("BlackColor"))
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("YellowColor"))
                                
                                Text(String(format: "%.1f", restaurant.rating))
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("BlackColor"))
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                   
                    
                   
                    Text("Description")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.black).padding(.top, 16)
                    Text(restaurant.description)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.black).opacity(0.8)
                }
                .padding()
            }
         
        }
    }}


#Preview {
    let dummyRestaurant = Restaurant(
            id: "rqdv5juczeskfw1e867",
            name: "Melting Pot",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
            pictureId: "14",
            city: "Medan",
            rating: 4.2
        )
        
        return NavigationStack {
            DetailRestaurantView(restaurant: dummyRestaurant)
        }
}
