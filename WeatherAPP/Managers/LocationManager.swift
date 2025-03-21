//
//  LocationManager.swift
//  WeatherAPP
//
//  Created by Teacher on 21/03/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
        
    }
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         location = locations.first?.coordinate
         isLoading = false
     }
     
     
     // This function will be called if we run into an error
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("Error getting location", error)
         isLoading = false
     }
 }
