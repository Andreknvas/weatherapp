//
//  WeatherView.swift
//  WeatherView
//
//  Created by Deko on 21/07/25.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
               Spacer()
                VStack(alignment: .center, spacing: 5){
                    
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        VStack(spacing: 15){
                            Image(systemName: getWeatherIcon(weather.weather[0].main))
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 110, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 90))
                            .fontWeight(.light)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                        image in image.resizable().aspectRatio(contentMode: .fit)
                            .frame(width:350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .center, spacing: 20) {
                    Text("Weather now in \(weather.name)")
                        .bold().padding(.bottom)
                    
                    HStack {
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.72, saturation: 1.0, brightness: 0.493))
                .background(Color.white.opacity(0.95))
                .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: -5)

                HStack{
                    Text("Powered by OpenWeather")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.8))
                }
                
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.72, saturation: 1.0, brightness: 0.493))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
