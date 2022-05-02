//
//  ApiRequest.swift
//  WeatherApp
//
//  Created by Mohammad Assad on 27/4/2022.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

class ApiRequest {
    
    /// method that calls the API, and returns an observable of the T generic type which is codable (Model)
    /// validates the status code to be 200...300
    
   
    static func apiCall( request : Endpoint) -> Observable<JSON> {
        
        /// create the observable of the type T
        return Observable<JSON>.create { observer -> Disposable in
            
            AF.request(request)
                .validate(statusCode: 200...300)
                
                .responseData { (response : AFDataResponse<Data>) in
                    
                    guard let statusCode = (response.response?.statusCode) else {
                        observer.onError(NetworkError.serverError)
                        return
                    }
                    switch response.result {
                    
                    case .success(let result):
                        guard !result.isEmpty else {
                            observer.onError(NetworkError.unknownError)
                            return
                        }
                        
                        guard (200...299).contains(statusCode) else {
                            observer.onError(NetworkError.serverError)
                            return
                        }
                        do {
                            let json = try JSON(data: result)
                            observer.onNext(json)
                            observer.onCompleted()
                        } catch {
                            observer.onError(NetworkError.parsingError)
                            print(error)
                            return
                        }
                              
                        
                       
                        
                    case .failure:
                        observer.onError(NetworkError.unknownError)
                    }
                
            }
            
            return Disposables.create()
        }
        

    }
    
    
    
    
    
    
    
  
    
}
