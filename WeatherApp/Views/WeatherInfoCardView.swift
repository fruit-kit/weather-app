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
            VStack(alignment: .leading) {
                Text(title)
                Text(value)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray)
        }
    }
}
