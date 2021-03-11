//
//  CityListViewModel.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import Foundation

class CityListViewModel {
    let list: [List]?
    let cityName: String?
    
    init(cityList: [List]?, cityName: String?) {
        self.list = cityList
        self.cityName = cityName
    }

}
