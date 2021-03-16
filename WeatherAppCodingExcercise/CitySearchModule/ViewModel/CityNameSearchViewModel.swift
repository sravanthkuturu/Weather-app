//
//  CityNameSearchViewModel.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import Foundation

class CityNameSearchViewModel {
    
    func validateTextField(value: String?) -> (Bool, String) {
        guard let inputString = value else {
            return (false, "Please enter city name")
        }
        if inputString.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return (false, "Please enter city name")
        }
        return (true, "")
    }
}
