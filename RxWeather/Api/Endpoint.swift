//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Mohammad Assad on 27/4/2022.
//

import Foundation
import Alamofire

/// enum that has all the endpoint of the apis in the application
/// with the url, method type, parameters and headers for each endpoint
/// converted to urlRequest
enum Endpoint: URLRequestConvertible {
  
    
   
    enum Constants {
          static let API_KEY = "54654c9d837196c5612965681a29a548"
          static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
          static let weatherLatLngQuery = "appid=%@&units=metric&lat=%f&lon=%f"
      }
      
      case weatherByLatLng(lat:Double, lng:Double)
     
      
      
      var url : URL {
          switch self {
          
          case .weatherByLatLng(let lat, let lng):
            
              let path = Constants.baseUrl+Constants.weatherLatLngQuery
              let urlString = String(format:path, Constants.API_KEY, lat, lng)
              print("heelll \(urlString)")
              return URL(string: urlString)!
              
          }
      }
      
      var method : HTTPMethod {
          switch self {
          default:
              return .get
          }
      }
      
      var parameters : [String:Any] {
          switch self {
          default:
              return [:]
          }
      }
      
      var headers : HTTPHeaders {
          switch self {
          default:
              return [:]
          }
      }
      
      func asURLRequest() throws -> URLRequest {
          var urlRequest = URLRequest(url: url)
          urlRequest.method = method
          urlRequest.headers = headers
          
          switch method {
          case .get, .delete:
              return try URLEncoding.default.encode(urlRequest, with: parameters)
          default:
              return try JSONEncoding.default.encode(urlRequest, with: parameters)
          }
      }
 
    
}
