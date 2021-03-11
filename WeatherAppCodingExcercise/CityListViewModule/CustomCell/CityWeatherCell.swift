//
//  CityWeatherCell.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import UIKit

class CityWeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityWeatherTypeLable: UILabel!
    @IBOutlet weak var cityWeatherTempratureLabel: UILabel!
    
    func setup(list: List?) {
        self.contentView.backgroundColor = UIColor(red: 216 / 255.0, green: 216 / 255.0, blue: 216 / 255.0, alpha: 1)
        cityWeatherTypeLable.text = list?.weather?.first?.main
        cityWeatherTempratureLabel.text = "Temp: " + "\(list?.main?.temp ?? 0.0)"
    }
    
}
