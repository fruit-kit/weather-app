//
//  ContentView.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 27.04.26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
    @State private var weather: WeatherResponse?
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    TextField("\(Image(systemName: "magnifyingglass")) Search city...", text: $city)
                        .padding(7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    Button {
                        Task {
                            do {
                                let service = WeatherService()
                                weather = try await service.fetchWeather(city: city)
                                city = ""
                            }
                            catch {
                                print(error.localizedDescription)
                            }
                        }
                    } label: {
                        Text("Search")
                    }
                    .padding(7)
                    .foregroundStyle(.gray)
                }
                
                VStack(alignment: .leading) {
                    Text(weather?.name ?? "N/A")
                    HStack {
                        if let weather {
                            Text("\(Int(weather.main.temp))°")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                        } else {
                            Text("N/A")
                        }
                        Image(systemName: "sun.max.fill")
                    }
                    if let weather {
                        Text(weather.weather.first?.description ?? "N/A")
                    }
                    HStack{
                        if let weather {
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
                    if let weather {
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
