import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
       @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                           if let weather = weather {
                               WeatherView(weather: weather)
                           } else {
                               LoadingView()
                                   .task {
                                       do {
                                           weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                       } catch {
                                           print("Error getting weather: \(error)")
                                       }
                                   }
                           }
                       } else {
                           if locationManager.isLoading {
                               LoadingView()
                           } else {
                               WelcomeView()
                                   .environmentObject(locationManager)
                           }
                       }
                   }
        .background(Color(hue: 0.618, saturation: 0.909, brightness: 0.658))  // Correctly applying background to the entire VStack
        .preferredColorScheme(.dark) // Setting the preferred color scheme
        
    }
}

#Preview {
    ContentView()
}
