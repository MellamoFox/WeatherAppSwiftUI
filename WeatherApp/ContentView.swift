//
//  ContentView.swift
//  WeatherApp
//
//  Created by VT on 14.11.2022.
//
//MARK : 1. Create model for data with 5 days forecast via wheater API
//MARK : 2. Create field for imput city
//MARK : 3. Create additional 5 views for different cities and buttons - load data
//MARK : 4. Chande day mode button should update forecast from day to night
//MARK : 5. Add animation for wheather



import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Kiev, UA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)

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
                    isNight.toggle()
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
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .yellow]),
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
