//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 28.04.26.
//

import SwiftUI
import Combine

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var inputCity: String = ""
    @Published var city: String = ""
    @Published var weather: WeatherResponse?
    private let cityKey = "city"
    
    private let service = WeatherService()
    
    init() {
        city = UserDefaults.standard.string(forKey: cityKey) ?? ""
        
        if !city.isEmpty {
            Task {
                await fetch()
            }
        }
    }
    
    func fetch() async {
        let cityToFetch = inputCity.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? city : inputCity
        
        do {
            let result = try await service.fetchWeather(city: cityToFetch)
            weather = result
            UserDefaults.standard.set(cityToFetch, forKey: cityKey)
            inputCity = ""
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
