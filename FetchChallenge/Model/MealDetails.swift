//
//  MealDetails.swift
//  FetchChallenge
//
//  Created by Developer on 8/28/24.
//

import Foundation

struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]
}

struct MealDetails: Identifiable, Decodable {
    let id: String
    let meal: String
    let drinkAlternate: String?
    let category: String
    let area: String
    let instructions: String
    let thumbnail: String
    let tags: String?
    let youtube: String?
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?
    let source: String?
    let imgSource: String?
    let creativeCommonsConfirmed: String?
    let dateModified: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case meal = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
        case source = "strSource"
        case imgSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified
    }
}

extension MealDetails {
    func getIngredients() -> [String]{
        var ingredients: [String] = []
        var ingredient: String = ""
        let mirror = Mirror(reflecting: self)
        
        for child in mirror.children  {
            if ("\(child.value)" != "Optional(\"\")" && "\(child.value)" != "Optional(\" \")" && "\(child.value)" != "nil"){
                if ("\(String(describing: child.label))".contains("ingredient")){
                    ingredient = "\(child.value)"
                    ingredient = ingredient.replacingOccurrences(of: "Optional(\"", with: "")
                    ingredient = ingredient.replacingOccurrences(of: "\")", with: "")
                    ingredients.append(ingredient)
                }
            }
        }
        
        return ingredients
    }
    
    func getMeasures() -> [String]{
        var measures: [String] = []
        var measure: String = ""
        let mirror = Mirror(reflecting: self)
        
        for child in mirror.children  {
            if ("\(child.value)" != "Optional(\"\")" && "\(child.value)" != "Optional(\" \")" && "\(child.value)" != "nil"){
                if ("\(String(describing: child.label))".contains("measure")){
                    measure = "\(child.value)"
                    measure = measure.replacingOccurrences(of: "Optional(\"", with: "")
                    measure = measure.replacingOccurrences(of: "\")", with: "")
                    measures.append(measure)
                }
            }
        }
        
        return measures
    }
}
