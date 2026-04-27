//
//  ContentView.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 27.04.26.
//

import SwiftUI

struct ContentView: View {
    
    @State var city: String = ""
    
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
                        print("Search tapped")
                    } label: {
                        Text("Search")
                    }
                    .padding(7)
                    .foregroundStyle(.gray)
                    
                }
                VStack(alignment: .leading) {
                    Text("London")
                    HStack {
                        Text("13°")
                        Image(systemName: "sun.max.fill")
                    }
                    Text("Overcast clouds")
                    HStack{
                        Text("Max: 17°")
                        Text("Min: 7°")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray)
                )
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
