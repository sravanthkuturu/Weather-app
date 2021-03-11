//
//  CityWeatherDetailViewModel.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import Foundation

class CityWeatherDetailViewModel {
    let list: List?
    
    init(list: List?) {
        self.list = list
    }
    
    func getTemprature() -> String {
        return "\(list?.main?.temp ?? 0.0)"
    }
    
    func getFeelsLike() -> String {
        return "\(list?.main?.feelsLike ?? 0.0)"
    }
    
    func getWeatherType() -> String? {
        return list?.weather?.first?.main
    }
    
    func getWeatherDescription() -> String? {
        return list?.weather?.first?.weatherDescription
    }
}
