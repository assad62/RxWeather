//
//  WeatherRepo.swift
//  RxWeather
//
//  Created by Mohammad Assad on 1/5/2022.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON

protocol WeatherRepoProtocol {
    func getLiveWeatherData(lat:Double, lng:Double) -> Observable<WeatherModel>
    
}

class WeatherRepo:WeatherRepoProtocol{
    
    var weatherRelay = BehaviorRelay<WeatherModel?>(value: nil)
    private let disposeBag = DisposeBag()
    private final var weatherService = WeatherService()
   
    
    private func convertJsonToModel(json wd:JSON)->WeatherModel{
        return WeatherModel(
                  tempLabel: wd["main"]["temp_max"].double,
                  tempDesc:  wd["weather"][0]["description"].stringValue,
                  tempImage: UIImage(named: WeatherImageService().getWeatherImage(conditonId: wd["weather"][0]["description"].int ?? 0)
                    )
        
        )
    }
    
    func getLiveWeatherData(lat: Double, lng: Double) -> Observable<WeatherModel> {
        
        return weatherService.getLiveData(lat: lat, lng: lng).map {
            wd in
            
            return self.convertJsonToModel(json: wd)
        }
    
  
    }
    
}
    
   
    
    

