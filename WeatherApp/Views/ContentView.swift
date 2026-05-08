//
//  ContentView.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 27.04.26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.white,
                    Color.blue.opacity(0.25)
                ],
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea()
            
            ScrollView {
            VStack(spacing: 20) {
                HStack {
                    TextField("\(Image(systemName: "magnifyingglass")) Search city...", text: $viewModel.inputCity)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(.systemBackground))
                                .opacity(0.5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.2))
                        )
                        .shadow(color: .black.opacity(0.1), radius: 10, y: 6)
                        .submitLabel(.search)
                        .onSubmit {
                            Task {
                                await viewModel.fetch()
                            }
                        }
                }
                if let weather = viewModel.weather {
                    MainWeatherInfoCardView(name: weather.name,
                                 temp: Int(weather.main.temp),
                                 icon: mapWeather(icon: weather.weather.first?.icon ?? "questionmark"),
                                 description: weather.weather.first?.description ?? "N/A",
                                 tempMax: Int(weather.main.tempMax),
                                 tempMin: Int(weather.main.tempMin))
                } else {
                    MainWeatherInfoCardView(name: "N/A",
                                 temp: nil,
                                 icon: "questionmark",
                                 description: "N/A",
                                 tempMax: nil,
                                 tempMin: nil)
                }
                LazyVGrid(columns: columns, spacing: 20) {
                    if let weather = viewModel.weather {
                        WeatherInfoCardView(title: "Feels like",
                                            value: "\(Int(weather.main.feelsLike))°", image: "thermometer")
                        WeatherInfoCardView(title: "Wind",
                                            value: "\(Int(weather.wind.speed)) m/s", image: "wind")
                        WeatherInfoCardView(title: "Humidity",
                                            value: "\(Int(weather.main.humidity))%", image: "drop")
                        WeatherInfoCardView(title: "Pressure",
                                            value: "\(Int(weather.main.pressure)) hPa", image: "gauge")
                        WeatherInfoCardView(title: "Visibility",
                                            value: "\(Int(weather.visibility / 1000)) km", image: "eye")
                        WeatherInfoCardView(title: "Cloudiness",
                                            value: "\(Int(weather.clouds.all))%", image: "cloud")
                        WeatherInfoCardView(title: "Sunrise",
                                            value: viewModel.formatTime(timestamp: weather.sys.sunrise), image: "sunrise")
                        WeatherInfoCardView(title: "Sunset",
                                            value: viewModel.formatTime(timestamp: weather.sys.sunset), image: "sunset")
                    } else {
                        ForEach(0..<6) { _ in
                            WeatherInfoCardView(title: "-", value: "N/A", image: "questionmark")
                        }
                    }
                    
                }
                .foregroundStyle(.gray)
            }
            .padding()
        }
    }
    }
}

#Preview {
    ContentView()
}
