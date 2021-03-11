//
//  NSObject+Name.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import Foundation

protocol NameDescribable {
    var name: String { get }
    static var name: String { get }
}

extension NameDescribable {
    var name: String {
        return String(describing: type(of: self))
    }
    
    static var name: String {
        return String(describing: self)
    }
}

extension NSObject: NameDescribable {}
