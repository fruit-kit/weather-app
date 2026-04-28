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
    @Published var city: String = ""
    @Published var weather: WeatherResponse?
    
    private let service = WeatherService()
    
    func fetch() async {
        do {
            let result = try await service.fetchWeather(city: city)
            weather = result
            city = ""
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
