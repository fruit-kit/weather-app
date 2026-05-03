//
//  WeatherInfoCardView.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 28.04.26.
//

import SwiftUI

struct WeatherInfoCardView: View {
    let title: String
    let value: String
    let image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 25))
                .frame(width: 35, height: 35)
                .foregroundStyle(.blue)
            VStack(alignment: .leading) {
                Text(title)
                Text(value)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2))
        )
        .shadow(color: .black.opacity(0.1), radius: 10, y: 6)
    }
}
