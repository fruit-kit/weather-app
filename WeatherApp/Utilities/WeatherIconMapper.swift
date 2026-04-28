//
//  WeatherIconMapper.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 28.04.26.
//

func mapWeather(icon: String) -> String {
    switch icon {
    case "01d":
        return "sun.max.fill"
    case "01n":
        return "moon.fill"
    case "02d":
        return "cloud.sun.fill"
    case "02n":
        return "cloud.moon.fill"
    case "03d", "03n", "04d", "04n":
        return "cloud.fill"
    case "09d", "09n", "10d", "10n":
        return "cloud.rain.fill"
    case "11d", "11n":
        return "cloud.bolt.fill"
    case "13d", "13n":
        return "snowflake"
    case "50d", "50n":
        return "cloud.fog.fill"
    default:
        return "questionmark"
    }
}
