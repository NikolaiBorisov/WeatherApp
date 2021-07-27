//
//  GetCititesWeather.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import Foundation
import CoreLocation

final class NetworkRequest {
    
    static let networkingManager = NetworkingManager()
    
    static func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
        for (index, item) in citiesArray.enumerated() {
            getCoordinates(city: item) { (coordinate, error) in
                guard let coordinate = coordinate, error == nil else { return }
                self.networkingManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                    completionHandler(index, weather)
                }
            }
        }
    }
    
    static func getCoordinates(city: String, comletion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(city) { (placemark, error) in
            comletion(placemark?.first?.location?.coordinate, error)
        }
    }
    
}
