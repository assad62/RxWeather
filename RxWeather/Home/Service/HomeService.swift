//
//  HomeService.swift
//  RxWeather
//
//  Created by Mohammad Assad on 1/5/2022.
//
import UIKit
import Foundation
import RxSwift
import RxCocoa


class HomeService {
    ///private final var locationRepo = LocationRepo()
    private final var weatherRepo =  WeatherRepo()
    private let disposeBag = DisposeBag()
    var addressRelay = BehaviorRelay<String>(value: "")
    var weatherRelay = BehaviorRelay<WeatherModel?>(value: nil)
    
    
    
    func getAddress(lat:Double, lng:Double,completion: @escaping ((String) -> ())) {
        
        AddressService.shared.convertLatLongToAddress(lat: lat, lng: lng) { loc in
            print(loc)
            self.addressRelay.accept(loc)
        }
    }
    
    func getLocationData() -> Observable<LocationModel>{
        
        
        return LocationService.shared.locationRelay.map { loc in
     

            return LocationModel(lat: loc.latitude, lng: loc.longitude)
        }
    }
    
    
    
    
    
    func getApiData(lat:Double, lng:Double,completion: @escaping ((WeatherModel) -> ())){
       
      
        weatherRepo.getLiveWeatherData(lat:lat, lng: lng).subscribe { weatherData  in

            completion(weatherData)
        } onError: {  error in

            guard error is NetworkError else { return }
            

        }.disposed(by: disposeBag)
        
        
    }
}
