//
//  MealViewModel.swift
//  FetchChallenge
//
//  Created by Developer on 8/28/24.
//

import Foundation

@MainActor
class MealViewModel: ObservableObject {
    enum State {
        case loading
        case loaded(meals: [Meal])
        case error(Error)
    }
    
    @Published var state: State = .loading
    
    let service = MealService()
    
    func loadMeals() async {
        do {
            let meals = try await service.getMealFromAPI()
            state = .loaded(meals: meals)
        } catch {
            state = .error(error)
        }
    }
}
