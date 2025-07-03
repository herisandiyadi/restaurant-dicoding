//
//  RestaurantListView.swift
//  SubmissionTest
//
//  Created by Heri Sandiyadi on 03/07/25.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel = RestaurantViewModel()
    @State private var selectedRestaurant: Restaurant? = nil

    var body: some View {
       
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(viewModel.restaurants) {
                            
                            restaurant in
                            CustomCardView(
                                title: restaurant.name,
                                imageUrl: restaurant.pictureId,
                                city: restaurant.city,
                                rating: restaurant.rating
                            )
                         
                            .listRowSeparator(.hidden)
                            .padding(8).onTapGesture {
                                selectedRestaurant = restaurant
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationDestination(item: $selectedRestaurant){
                        restaurant in DetailRestaurantView(restaurant: restaurant)
                    }
                }
            }  .onAppear {
                viewModel.loadData()
            }
        }
        
        
       
    }
  
           
    


#Preview {
    RestaurantListView()
}
