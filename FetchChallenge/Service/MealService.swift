//
//  MealService.swift
//  FetchChallenge
//
//  Created by Developer on 8/28/24.
//

import Foundation

class MealService {
    func getMealFromAPI() async throws -> [Meal] {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        let decoded = try decoder.decode(MealResponse.self, from: data)
        
        return decoded.meals
    }
}
