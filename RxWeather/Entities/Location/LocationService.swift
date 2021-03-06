//
//  LocationService.swift
//  RxWeather
//
//  Created by Mohammad Assad on 1/5/2022.
//

import Foundation
import CoreLocation
import RxSwift
import RxRelay





class LocationService:NSObject,CLLocationManagerDelegate {
   
    static let shared = LocationService()
    var currentLocation: CLLocation!
    let locationRelay = BehaviorRelay<CLLocationCoordinate2D>(value: CLLocationCoordinate2D())

    lazy var locationManager: CLLocationManager = {
            let locationManager = CLLocationManager()
        locationManager.delegate = self
            locationManager.activityType = CLActivityType.other
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.pausesLocationUpdatesAutomatically = true
           

            return locationManager
        }()
    
   
    private override init() {
        super.init()

        self.locationManager.requestWhenInUseAuthorization()
    }


    
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
                
            case .authorizedAlways, .authorizedWhenInUse:
                locationRelay.accept(manager.location?.coordinate ?? CLLocationCoordinate2D())
             
            case .notDetermined:
                print("notDetermined")
                manager.requestWhenInUseAuthorization()
            default:
                break
            }
    }

    
    
}
