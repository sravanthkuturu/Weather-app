//
//  ViewController.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import UIKit

class CityNameSearchVC: UIViewController {
    
    @IBOutlet weak var cityNameSearchButton: UIButton!
    @IBOutlet weak var cityNameTextField: UITextField!
    
    let citySearchViewModel = CityNameSearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    fileprivate func setupUI() {
        cityNameSearchButton.setTitle("Look Up", for: .normal)
        cityNameSearchButton.layer.cornerRadius = 8.0
        cityNameSearchButton.layer.borderColor = UIColor.black.cgColor
        cityNameSearchButton.layer.borderWidth = 1.0
    }
    
    @IBAction func tapSearchCityNameButton(_ sender: UIButton) {
        self.view.endEditing(true)
        let validationResult = citySearchViewModel.validateTextField(value: cityNameTextField.text)
        if validationResult.0 == false {
            presentAlert(withTitle: "Validation Error", message: validationResult.1)
        } else {
            
            guard NetworkConnectivity.isConnected else {
                // Show internet connection alert
                presentAlert(withTitle: "No internet connection", message: "Please check your internet connection and try again!")
                return
            }
            
            
            AppLoader().showProgress(status: "Loading...", blockUI: true)
            CityNameSearchService.shared.processCityWeatherServiceAPIRequest(cityName: cityNameTextField.text ?? "") { [weak self] (model, error) in
                
                defer {
                    AppLoader().hideProgress()
                }
                
                guard let self = self,
                    error == nil,
                    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: CityListViewController.name) as? CityListViewController  else {
                        return
                }
                
                DispatchQueue.main.async {
                    let viewModel = CityListViewModel(cityList: model?.list, cityName: self.cityNameTextField.text)
                    controller.cityListViewModel = viewModel
                    let backItem = UIBarButtonItem()
                    backItem.title = self.cityNameTextField.text
                    self.navigationItem.backBarButtonItem = backItem
                    self.navigationController?.pushViewController(controller, animated: true)
                    
                }
                
            }
        }
        
    }
    
}
