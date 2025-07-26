//
//  WelcomeView.swift
//  WeatherView
//
//  Created by Deko on 21/07/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to Weather View")
                    .bold().font(.title)
                
                Text("Please, share your current location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
                    
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
