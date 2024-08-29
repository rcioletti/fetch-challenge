//
//  Meal.swift
//  fetch-ios
//
//  Created by Developer on 8/28/24.
//

import Foundation

struct MealResponse: Decodable {
    let meals: [Meal]
}

struct Meal: Identifiable, Codable {
    let id: String
    let	meal: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case meal = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

extension Meal {
    static var mock: Meal {
        Meal(
            id: "53049",
            meal: "Apam balik",
            thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"
        )
    }
}

extension Array<Meal> {
    static var mock: [Meal] {
        [
            Meal(
            id: "53049",
            meal: "Apam balik",
            thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"
            ),
            Meal(
            id: "52893",
            meal: "Apple & Blackberry Crumble",
            thumbnail: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"
            ),
            Meal(
            id: "52768",
            meal: "Apple Frangipan Tart",
            thumbnail: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"
            )
        ]
    }
}
