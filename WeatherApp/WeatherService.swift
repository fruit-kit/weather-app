//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 27.04.26.
//

import Foundation

final class WeatherService {
    
    func fetchWeather(city: String) async throws -> WeatherResponce {
        
        let trimmingCity = city.trimmingCharacters(in: .whitespacesAndNewlines)
        let cityToUse = trimmingCity.isEmpty ? "Kyiv" : trimmingCity
        
        guard let decodedCity = cityToUse.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw URLError(.badURL)
        }
        
        let apiKey = "d5f1fc7218c783007518b12043821547"
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(decodedCity)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let dataString = String(data: data, encoding: .utf8)!
        print(dataString)
        
        let decodedWeather = try JSONDecoder().decode(WeatherResponce.self, from: data)
        
        return decodedWeather
    }
}
