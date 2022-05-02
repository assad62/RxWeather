//
//  HomeViewComponents.swift
//  RxWeather
//
//  Created by Mohammad Assad on 1/5/2022.
//

import Foundation
import UIKit

struct HomeViewComponents{
    var tempLabel: UILabel = {
       let tempLabel = UILabel()
       tempLabel.textAlignment = .center
       tempLabel.translatesAutoresizingMaskIntoConstraints = false
       tempLabel.font =  UIFont(name:"Avenir Next Medium",size:26)
       tempLabel.textColor = .lightGray
       return tempLabel
   }()
   
    var tempDetailLabel: UILabel = {
       let tempDetailLabel = UILabel()
       tempDetailLabel.textAlignment = .center
       tempDetailLabel.translatesAutoresizingMaskIntoConstraints = false
       tempDetailLabel.font =  UIFont(name:"Avenir Next Demi Bold",size:26)
       tempDetailLabel.textColor = .black
       return tempDetailLabel
   }()
   
   
    var mainImage: UIImageView = {
       let mainImage = UIImageView()
       //let mainImage = UIImageView(image: UIImage(named: "imClear"))
       mainImage.translatesAutoresizingMaskIntoConstraints = false
       let aspectRatioConstraint = NSLayoutConstraint(
           item: mainImage,
           attribute: .width,
           relatedBy: .equal,
           toItem: mainImage,
           attribute: .height,
           multiplier: (1.0 / 1.0),
           constant: 0)
       mainImage.addConstraint(aspectRatioConstraint)
       return mainImage
   }()
   
   
   var loadingView: UIActivityIndicatorView = {
           let ai = UIActivityIndicatorView()
           ai.style = UIActivityIndicatorView.Style.large
           ai.startAnimating()
           ai.translatesAutoresizingMaskIntoConstraints = false
           
          return ai
   }()
}


extension HomeViewComponents {
    var destructured: (UILabel, UILabel, UIImageView, UIActivityIndicatorView) {
        
        
        return (self.tempLabel, self.tempDetailLabel, self.mainImage, self.loadingView)
    }
}
