//
//  AddLocationAlert.swift
//  RxWeather
//
//  Created by Mohammad Assad on 4/5/2022.
//

import Foundation
import UIKit

class AddLocationAlert:UIViewController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        view.backgroundColor = UIColor(white: 0.3, alpha: 0.1)
        setupGestures()
        setupViews()
        
    }
    
    func setupViews(){
            let loginButton = makeButton(withText: "Go back")
            view.addSubview(loginButton)
            
            
            NSLayoutConstraint.activate([
                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loginButton.heightAnchor.constraint(equalToConstant: 40.0),
                loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                loginButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        
        }
        
        
        @objc func buttonAction(sender: UIButton!) {
            print("Button tapped")
         }
        
        func makeButton(withText text:String)->UIButton{
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.black, for: .normal)
            button.setTitle(text, for: .normal)
            button.backgroundColor = .systemMint
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            return button
        }
    
    
    
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
}
