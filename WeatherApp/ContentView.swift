//
//  ContentView.swift
//  WeatherApp
//
//  Created by Robert Kotrutsa on 27.04.26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
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
                        print("Search tapped")
                    } label: {
                        Text("Search")
                    }
                    .padding(7)
                    .foregroundStyle(.gray)
                }
                
                VStack(alignment: .leading) {
                    Text("Location: N/A")
                    HStack {
                        Text("N/A")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        Image(systemName: "sun.max.fill")
                    }
                    Text("Description: N/A")
                    HStack{
                        Text("Max:")
                        Text("N/A")
                            .fontWeight(.bold)
                        Text("Min:")
                        Text("N/A")
                            .fontWeight(.bold)
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
                        Text("Feels like")
                        Text("N/A")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        Text("Wind")
                        Text("N/A")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        Text("Humidity")
                        Text("N/A")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        Text("Pressure")
                        Text("N/A")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        Text("Visibility")
                        Text("N/A")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                    }
                    VStack(alignment: .leading) {
                        Text("Cloudiness")
                        Text("N/A")
                            .fontWeight(.bold)
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
