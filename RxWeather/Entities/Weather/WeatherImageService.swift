//
//  WeatherImageService.swift
//  RxWeather
//
//  Created by Mohammad Assad on 1/5/2022.
//

import Foundation

struct WeatherImageService {
     func getWeatherImage(conditonId:Int) ->String {
     
        switch conditonId {
         case 200...299:
            return "imThunderstorm"
         case 300...399:
            return "imDrizzle"
         case 500...599:
            return "imRain"
         case 600...699:
            return "imSnow"
         case 700...799:
            return "imAtmosphere"
        case 800:
            return "imClear"
        default:
            return "imClouds"
        }
    }
}
