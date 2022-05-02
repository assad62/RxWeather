//
//  WeatherService.swift
//  RxWeather
//
//  Created by Mohammad Assad on 1/5/2022.
//

import Foundation

import UIKit
import RxCocoa
import RxSwift
import SwiftyJSON


protocol WeatherServiceProtocol{
    func getLiveData(lat:Double, lng:Double) -> Observable<JSON>
}

class WeatherService:WeatherServiceProtocol {
   
    func getLiveData(lat:Double, lng:Double) ->Observable<JSON> {
        return ApiRequest.apiCall(request: .weatherByLatLng(lat: lat, lng: lng))
    }
    
}
