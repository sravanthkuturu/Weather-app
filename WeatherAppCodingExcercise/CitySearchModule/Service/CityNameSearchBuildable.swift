//
//  APIBuildable.swift
//  ReusableLibrary
//
//  Created by Sravanth Kuturu on 20/01/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

enum CityNameSearchBuildable: Buildable {
    
    case urlRequest(cityName: String)
    
    var queryParams: [QueryParms] {
        switch self {
        case .urlRequest(let cityName):
            return [QueryParms(key: "q", value: cityName)]
        }
    }
    
    var methodType: AppHTTPMethod {
        switch  self {
        case .urlRequest:
            return .get
        }
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var requestBody: [String : Any]? {
        return nil
    }

}
