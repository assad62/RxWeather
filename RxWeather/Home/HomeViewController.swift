//
//  ViewController.swift
//  UIKitTest
//
//  Created by Development on 19/4/2022.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    var tempLabel = UILabel()
    var tempDetailLabel = UILabel()
    var addressLabel = UILabel()
    var mainImage = UIImageView()
    var loadingView = UIActivityIndicatorView()

    private let viewModel : HomeViewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
       
    }
    
    
    
    
    func setupNavigationBar(){
        let add = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped))
        
        navigationItem.rightBarButtonItems = [add]
        
        let location = UIBarButtonItem(
            image: UIImage( systemName: "location"),
            style: .plain,
            target: self,
            action: #selector(locationTapped)
        )
        
        navigationItem.leftBarButtonItems = [location]
        
       
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
       
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    
    @objc func locationTapped(){
        viewModel.getCurrentLocationTemp()
    }
    
    @objc func addTapped(){
        
    }
    
    
    
    
    func setupViews(){
        
        let s = HomeViewComponents()
        let (_tempLabel, _tempDetailLabel, _addressLabel, _mainImage, _loadingView) = s.destructured
        
        tempLabel = _tempLabel
        tempDetailLabel = _tempDetailLabel
        addressLabel = _addressLabel
        mainImage = _mainImage
        loadingView = _loadingView
        
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis  = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(mainImage)
        stackView.addArrangedSubview(tempLabel)
        stackView.addArrangedSubview(tempDetailLabel)
        //stackView.addArrangedSubview(addressLabel)
        
       
        view.addSubview(addressLabel)
       
        
        
        view.addSubview(loadingView)
          
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.heightAnchor.constraint(equalTo: view.heightAnchor),
            loadingView.widthAnchor.constraint(equalTo: view.widthAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            addressLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            
        ])
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        viewModel.weatherLiveData.subscribe(onNext: { [weak self] weatherData in
           
            if let wd = weatherData{
                
                self?.tempLabel.text =  "\(String(wd.tempLabel!))°C"
                self?.tempDetailLabel.text = wd.tempDesc
                self?.mainImage.image = wd.tempImage
                
            }
            
        }).disposed(by: disposeBag)

        
        
       viewModel.loadingRelay.subscribe(onNext: { [weak self] isLoading in
            if isLoading{
                self?.loadingView.startAnimating()
            }
            else{
                self?.loadingView.stopAnimating()
            }
           
        }).disposed(by: disposeBag)
        
        
        viewModel.addressLiveData.subscribe(onNext: { [weak self] address in
            
            self?.addressLabel.text = address
           
        }).disposed(by: disposeBag)
        

        
        
        
    }
    
    
   
}


