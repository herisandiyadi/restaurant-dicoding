//
//  RestaurantViewModel.swift
//  SubmissionTest
//
//  Created by Heri Sandiyadi on 03/07/25.
//

import Foundation


class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    func loadData() {
        isLoading = true
        DispatchQueue.global().async {
            guard let url = Bundle.main.url(forResource: "resto", withExtension: "json"),
                  let data = try? Data(contentsOf: url) else {
                DispatchQueue.main.async {
                    self.error = NSError(domain: "File not found", code: 404)
                    self.isLoading = false
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode(RestaurantResponse.self, from: data)
                DispatchQueue.main.async {
                    self.restaurants = response.restaurants
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
}
