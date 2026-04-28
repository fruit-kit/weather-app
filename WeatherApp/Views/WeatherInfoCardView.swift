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
    
    var body: some View {
        VStack(alignment: .leading) {
                Text(title)
                Text(value)
                    .fontWeight(.bold)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray)
        }
    }
}
