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
            BackgroundView(topColor: .blue,
                           bottomColor: .yellow)
            VStack {
                CityTextView(cityName: "Kiev, UA")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)

                HStack(spacing: 20) {
                    WeatherDayView(dayofWeek: "TUE",
                                imageName: "cloud.sun.fill",
                                temperature: 75)
                    WeatherDayView(dayofWeek: "WED",
                                imageName: "sun.max.fill",
                                temperature: 88)
                    WeatherDayView(dayofWeek: "THU",
                                imageName: "wind.snow",
                                temperature: 55)
                    WeatherDayView(dayofWeek: "FRI",
                                imageName: "sunset.fill",
                                temperature: 60)
                    WeatherDayView(dayofWeek: "SAT",
                                imageName: "snow",
                                temperature: 25)
                }

                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Cnahge day mode")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20,
                                      weight: .bold,
                                      design: .default))
                        .cornerRadius(10)
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

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading )
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
                Text("\(temperature) °")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton:View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .default))
            .cornerRadius(10)
    }
}
