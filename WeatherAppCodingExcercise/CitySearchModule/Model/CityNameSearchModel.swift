//
//  CityNameSearchModel.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct CityNameSearchModel: Codable {
    let list: [List]?
}

// MARK: - List
struct List: Codable {
    let main: MainClass?
    let weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case main, weather
    }
}

struct MainClass: Codable {
    let temp, feelsLike: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
       
    }
}


struct Weather: Codable {
    let id: Int?
    let main: String?
    let weatherDescription: String?
    let icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

