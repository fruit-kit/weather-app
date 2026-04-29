//
//  Weather.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 27.04.26.
//
import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String?
    let main: Main
    let visibility: Int // used
    let wind: Wind
    let clouds: Clouds
    let dt: Int?
    let sys: Sys
    let timezone: Int?
    let id: Int?
    let name: String // used
    let cod: Int?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int // used
}

// MARK: - Coord
struct Coord: Codable {
    let lon: Double?
    let lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double // used
    let feelsLike: Double // used
    let tempMin: Double // used
    let tempMax: Double // used
    let pressure: Int // used
    let humidity: Int // used
    let seaLevel: Int?
    let grndLevel: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: String?
    let description: String // used
    let icon: String // used
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double // used
    let deg: Int?
    let gust: Double?
}

