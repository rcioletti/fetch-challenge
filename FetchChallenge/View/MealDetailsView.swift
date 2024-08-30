//
//  MealDetailsView.swift
//  FetchChallenge
//
//  Created by Developer on 8/28/24.
//

import SwiftUI

struct MealDetailsView: View {
    
    var meal: Meal
    @StateObject private var viewModel = MealDetailsViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error(let error):
                Text(error.localizedDescription)
            case .loaded(let mealDetails):
                details(of: mealDetails)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(meal.meal)
        .task {
            viewModel.meal = meal
            await viewModel.loadMealDetails()
        }
    }
    
    @ViewBuilder
    func details(of mealDetails: MealDetails) -> some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: mealDetails.thumbnail)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                Divider()
                Text("Instructions")
                    .font(.headline)
                    .padding()
                Divider()
                Text(mealDetails.instructions)
                    .padding()
                Divider()
                Text("Ingredients")
                    .font(.headline)
                    .padding()
                Divider()
                VStack{
                    ingredients(of: mealDetails)
                }
                .padding()
            }
        }
    }
    
    func ingredients(of mealDetails: MealDetails) -> some View {
        let measures = mealDetails.getMeasures()
        let ingredients = mealDetails.getIngredients()
        
        
        return ForEach(0..<measures.count, id: \.self) { index in
            Text("\u{2022} \(measures[index]) \(ingredients[index])")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    MealDetailsView(meal: .mock)
}
