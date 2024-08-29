//
//  MealDetailsViewModel.swift
//  FetchChallenge
//
//  Created by Developer on 8/28/24.
//

import Foundation

@MainActor
class MealDetailsViewModel: ObservableObject {
    enum State {
        case loading
        case loaded(mealDetails: MealDetails)
        case error(Error)
    }
    
    @Published var state: State = .loading
    
    let service = MealDetailsService()
    
    var meal: Meal = .mock
    
    func loadMealDetails() async {
        do {
            let mealDetails = try await service.getMealDetailsFromAPI(mealId: meal.id )
            state = .loaded(mealDetails: mealDetails)
        } catch {
            state = .error(error)
        }
    }
}
