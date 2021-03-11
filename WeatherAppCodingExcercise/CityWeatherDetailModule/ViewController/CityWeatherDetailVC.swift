//
//  CityWeatherDetailVC.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import UIKit

class CityWeatherDetailVC: UIViewController {
    
    @IBOutlet weak var tempratureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var weatherDesciptionLabel: UILabel!

    var cityWeatherDetailVM: CityWeatherDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setupDetailView()
    }
    
    fileprivate func setupDetailView() {
        tempratureLabel.text = cityWeatherDetailVM?.getTemprature()
        feelsLikeLabel.text = "Feels Like: " + "\(cityWeatherDetailVM?.getFeelsLike() ?? "")"
        weatherTypeLabel.text = cityWeatherDetailVM?.getWeatherType()
        weatherDesciptionLabel.text = cityWeatherDetailVM?.getWeatherDescription()
    }

}
