//
//  ContentView.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 27.04.26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
    @State private var weather: WeatherResponce?
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
                    Text(weather?.name ?? "Location: N/A")
                    HStack {
                        if let weather {
                            Text("\(Int(weather.main.temp))°")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                        } else {
                            Text("Temp: N/A")
                        }
                        Image(systemName: "sun.max.fill")
                    }
                    if let weather {
                        Text(weather.weather.first?.description ?? "Description: N/A")
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
                    VStack(alignment: .leading) {
                        if let weather {
                            Text("Feels like")
                            Text("\(Int(weather.main.feelsLike))°")
                                .fontWeight(.bold)
                        } else {
                            Text("Feels like")
                            Text("N/A")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        if let weather {
                            Text("Wind")
                            Text("\(Int(weather.wind.speed)) m/s")
                                .fontWeight(.bold)
                        } else {
                            Text("Wind")
                            Text("N/A")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        if let weather {
                            Text("Humidity")
                            Text("\(weather.main.humidity) %")
                                .fontWeight(.bold)
                        } else {
                            Text("Humidity")
                            Text("N/A")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        if let weather {
                            Text("Pressure")
                            Text("\(weather.main.pressure) hPa")
                                .fontWeight(.bold)
                        } else {
                            Text("Pressure")
                            Text("N/A")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        if let weather {
                            Text("Visibility")
                            Text("\(weather.visibility / 1000) km")
                                .fontWeight(.bold)
                        } else {
                            Text("Visibility")
                            Text("N/A")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        if let weather {
                            Text("Cloudiness")
                            Text("\(weather.clouds.all) %")
                                .fontWeight(.bold)
                        } else {
                            Text("Cloudiness")
                            Text("N/A")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
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
