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
   var addressLiveData = BehaviorRelay<String>(value: "")

   private let disposeBag = DisposeBag()
    
  
    
    init(){
        getCurrentLocationTemp()
    }
    
    
    func getCurrentLocationTemp(){
        loadingRelay.accept(true)
       
        self.homeService.getLocationData().subscribe( onNext: ({[weak self] loc in
          
            self?.loadingRelay.accept(false)
            
            self?.homeService.getApiData(lat: loc.lat , lng: loc.lng) {
                 weatherData in
                 
                 self?.weatherLiveData.accept(weatherData)
        
            }
            
        
            self?.homeService.getAddress(lat: loc.lat, lng: loc.lng, completion: { adr in
                
                 self?.addressLiveData.accept(adr)
            })
            
            
            
         
        })).disposed(by: disposeBag)
        
        
    
        
      
        
        
    }
       
        
        
        
      
    
}
