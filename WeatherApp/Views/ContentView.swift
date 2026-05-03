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
                            RoundedRectangle(cornerRadius: 5)
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
                
                VStack(alignment: .leading) {
                    Text(viewModel.weather?.name ?? "N/A")
                    HStack {
                        if let weather = viewModel.weather {
                            Text("\(Int(weather.main.temp))°")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                            if let icon = weather.weather.first?.icon {
                                Image(systemName: mapWeather(icon: icon))
                            } else {
                                Image(systemName: "questionmark")
                            }
                        } else {
                            Text("N/A")
                            Image(systemName: "questionmark")
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
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray)
                )
                
                LazyVGrid(columns: columns, spacing: 20) {
                    if let weather = viewModel.weather {
                        WeatherInfoCardView(title: "Feels like",
                                            value: "\(Int(weather.main.feelsLike))°")
                        WeatherInfoCardView(title: "Wind",
                                            value: "\(Int(weather.wind.speed)) m/s")
                        WeatherInfoCardView(title: "Humidity",
                                            value: "\(Int(weather.main.humidity))%")
                        WeatherInfoCardView(title: "Pressure",
                                            value: "\(Int(weather.main.pressure)) hPa")
                        WeatherInfoCardView(title: "Visibility",
                                            value: "\(Int(weather.visibility / 1000)) km")
                        WeatherInfoCardView(title: "Cloudiness",
                                            value: "\(Int(weather.clouds.all))%")
                        WeatherInfoCardView(title: "Sunrise",
                                            value: viewModel.formatTime(timestamp: weather.sys.sunrise))
                        WeatherInfoCardView(title: "Sunset",
                                            value: viewModel.formatTime(timestamp: weather.sys.sunset))
                    } else {
                        ForEach(0..<6) { _ in
                            WeatherInfoCardView(title: "-", value: "N/A")
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
