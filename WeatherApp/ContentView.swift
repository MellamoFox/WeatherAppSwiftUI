//
//  ContentView.swift
//  WeatherApp
//
//  Created by VT on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .yellow]),
                        startPoint: .topLeading,
                        endPoint: .bottomLeading )
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Kiev, UA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                        Text("76 °")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                HStack {
                    WeatherDayView(dayofWeek: "TUE",
                                imageName: "cloud.sun.fill",
                                temperature: 75)
                }

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayofWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        HStack(spacing: 30) {
            VStack(alignment: .trailing) {
                Text(dayofWeek)
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(temperature)°")
                    .foregroundColor(.white)
            }
            
        }
    }
}
