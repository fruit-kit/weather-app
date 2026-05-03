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
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    TextField("\(Image(systemName: "magnifyingglass")) Search city...", text: $viewModel.inputCity)
                        .padding(7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    Button {
                        Task {
                            await viewModel.fetch()
                        }
                    } label: {
                        Text("Search")
                    }
                    .padding(7)
                    .foregroundStyle(.gray)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.weather?.name ?? "N/A")
                        .foregroundStyle(.black)
                    HStack {
                        if let weather = viewModel.weather {
                            Text("\(Int(weather.main.temp))°")
                                .font(.system(size: 42))
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                            if let icon = weather.weather.first?.icon {
                                Image(systemName: mapWeather(icon: icon))
                                    .font(.system(size: 30))
                            } else {
                                Image(systemName: "questionmark")
                                    .font(.system(size: 30))
                            }
                        } else {
                            Text("N/A")
                                .font(.system(size: 42))
                                .fontWeight(.bold)
                            Image(systemName: "questionmark")
                                .font(.system(size: 30))
                        }
                    }
                    if let weather = viewModel.weather {
                        Text(weather.weather.first?.description ?? "N/A")
                    }
                    HStack{
                        if let weather = viewModel.weather {
                            Text("Max: \(Int(weather.main.tempMax))°")
                            Text("Min: \(Int(weather.main.tempMin))°")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                )
                
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

#Preview {
    ContentView()
}
