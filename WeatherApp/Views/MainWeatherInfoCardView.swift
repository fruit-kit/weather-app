//
//  MainInfoCard.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 08.05.26.
//

import SwiftUI

struct MainWeatherInfoCardView: View {
    
    let name: String
    let temp: Int?
    let icon: String
    let description: String
    let tempMax: Int?
    let tempMin: Int?
    
    var body: some View {
        ZStack {
            Image(.bg)
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .foregroundStyle(.black)
                    .font(.system(size: 20))
                HStack {
                    Group {
                        if let temp {
                            Text("\(temp)°")
                        } else {
                            Text("N/A")
                        }
                    }
                    .font(.system(size: 80))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    Image(systemName: icon)
                        .font(.system(size: 40))
                }
                Text(description)
                HStack{
                    if let tempMax,
                       let tempMin {
                        Text("Max: \(tempMax)°")
                        Text("Min: \(tempMin)°")
                    } else {
                        Text("N/A")
                        Text("N/A")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.gray)
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.2), radius: 10, y: 6)
    }
}
