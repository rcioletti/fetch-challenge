//
//  MealView.swift
//  FetchChallenge
//
//  Created by Developer on 8/28/24.
//

import SwiftUI

struct MealView: View {
    
    @StateObject private var viewModel = MealViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error(let error):
                Text(error.localizedDescription)
            case .loaded(let meals):
                list(of: meals)
            }
        }
        .navigationTitle("Desserts")
        .task {
            await viewModel.loadMeals()
        }
    }
    
    @ViewBuilder
    func list(of meals: [Meal]) -> some View {
        if meals.isEmpty == false {
            List (meals) { meal in
                NavigationLink{
                    MealDetailsView(meal: meal)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: meal.thumbnail)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: 120, alignment: .leading)
                        
                        Text(meal.meal)
                            .font(.headline)
                            .padding()
                    }
                }
            }
            .listStyle(.inset)
        } else {
            Text("No desserts to display")
        }
    }
}

#Preview {
    NavigationStack{
        MealView()
    }
}
