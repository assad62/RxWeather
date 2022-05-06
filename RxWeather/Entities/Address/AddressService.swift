//
//  AddressService.swift
//  RxWeather
//
//  Created by Mohammad Assad on 2/5/2022.
//

import Foundation
import CoreLocation
import RxSwift
import RxCocoa


class AddressService:NSObject {
    
    static let shared = AddressService()
  
    let geoCoder = CLGeocoder()
    
    
    
    private func getAddress(lat:Double, lng:Double,handler: @escaping (String) -> Void)
    {
       
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: lng)
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark?
            placeMark = placemarks?[0]
            var address = ""

            
             let city = placeMark?.administrativeArea ?? ""
             let country = placeMark?.country ?? ""
            
             address = "\(city), \(country)"
           
             handler(address)
        })
    }
    
    
    func convertLatLongToAddress(lat:Double, lng:Double,completion: @escaping ((String) -> ())){
       
        getAddress(lat: lat, lng: lng) { (address) in
             completion(address)
        }
    
    }
}
