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
    
    func convertLatLongToAddress(lat:Double, lng:Double,completion: @escaping ((String) -> ())){
        
        geoCoder.reverseGeocodeLocation(CLLocation(latitude: lat, longitude: lng)) { (placemarks, error) -> Void  in
            
            var locName = ""
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            locName.append(placeMark.location?.description ?? "")
            
            completion(locName)
            
        }
        
    }
    
    
    
//    func convertLatLongToAddress(lat:Double, lng:Double,completion: @escaping ((String) -> ())){
//        var locName = "Loc"
//        let geoCoder = CLGeocoder()
//        let location = CLLocation(latitude: lat, longitude: lng)
//
//       geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//
//            // Place details
//            var placeMark: CLPlacemark!
//            placeMark = placemarks?[0]
//
//            // Location name
//            if let locationName = placeMark.location {
//                locName.append(locationName.description)
//            }
//            // Street address
//            if let street = placeMark.thoroughfare {
//                print(street)
//                locName.append(contentsOf: street)
//            }
//            // City
//            if let city = placeMark.locality {
//                print(city)
//                locName.append(contentsOf: city)
//            }
//
//
//            // Country
//            if let country = placeMark.country {
//                print(country)
//                locName.append(contentsOf: country)
//            }
//
//            completion(locName)
//
//
//
//        })
//
//
//    }
}


//extension CLLocation {
//    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
//        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
//    }
//}
