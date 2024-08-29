//
//  MealDetailsService.swift
//  FetchChallenge
//
//  Created by Developer on 8/28/24.
//

import Foundation

class MealDetailsService {
    func getMealDetailsFromAPI(mealId: String) async throws -> MealDetails {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        let decoded = try decoder.decode(MealDetailsResponse.self, from: data)
        
        return decoded.meals[0]
    }
}
