//
//  File.swift
//  SubmissionTest
//
//  Created by Heri Sandiyadi on 02/07/25.
//
import Foundation

// MARK: - Main Response
struct RestaurantResponse: Codable {
    let error: Bool
    let message: String
    let count: Int
    let restaurants: [Restaurant]
}

// MARK: - Restaurant Model
struct Restaurant: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let pictureId: String
    let city: String
    let rating: Double
}
