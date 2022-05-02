//
//  HomeViewModel.swift
//  RxWeather
//
//  Created by Mohammad Assad on 1/5/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeViewModel {
    
   private var homeService = HomeService()
   var loadingRelay = BehaviorRelay<Bool>(value: true)
   var weatherLiveData = BehaviorRelay<WeatherModel?>(value: nil)
    
    var w1 = BehaviorRelay<Double?>(value: nil)
    var w2 = BehaviorRelay<Double?>(value: nil)
    private let disposeBag = DisposeBag()
    
  
    
    init(){
        getCurrentLocationTemp()
    }
    
    
    func getCurrentLocationTemp(){
        loadingRelay.accept(true)
        
       
            
        self.homeService.getLocationData().subscribe( onNext: ({[weak self] loc in
            print(loc.lat)
            self?.loadingRelay.accept(false)
            self?.homeService.getApiData(lat: loc.lat , lng: loc.lng) {
                 weatherData in
                 
                 
                 self?.weatherLiveData.accept(weatherData)
            }
            
            
        }))
        .disposed(by: disposeBag)
        
        
    }
       
        
        
        
      
    
}
