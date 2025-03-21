//
//  WelcomeView.swift
//  WeatherAPP
//
//  Created by Teacher on 21/03/25.
//

import SwiftUI
import CoreLocationUI
struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack(spacing: 20){
            Text("Welcome to the Weather App")
                .bold().font(.title)
            Text("Share your location to get accurate weather updates for your area")
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
        .frame(maxWidth: .infinity,maxHeight: .infinity )
        
    }

    
}

#Preview {
    WelcomeView()
}
