//
//  ItunesService.swift
//  ReusableLibrary
//
//  Created by Sravanth Kuturu on 20/01/2021.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation


enum CitySearchServiceAPIError {
    case buildableError

    var errorMessage: String {
        switch self {
        case .buildableError: return "Error in forming buildable"
        }
    }

    var errorCode: Int {
        switch self {
        case .buildableError: return 400
        }
    }
}

class CityNameSearchService: NSObject {

    public static let shared = CityNameSearchService()
    private override init() {}
    var apiBuildable: CityNameSearchBuildable?
    var baseURL: String?

    func processCityWeatherServiceAPIRequest(cityName: String,
        urlSession: URLSessionProtocol = URLSession.shared,
        completion: @escaping ((CityNameSearchModel?, AppAPIServiceError?) -> Void)) {

        let client = AppHttpClient(urlSession)

        self.apiBuildable = CityNameSearchBuildable.urlRequest(cityName: cityName)

        guard let buildable = self.apiBuildable else {
            completion(nil, AppAPIServiceError(message: CitySearchServiceAPIError.buildableError.errorMessage, errorCode: CitySearchServiceAPIError.buildableError.errorCode))

            return
        }

        client.processAPIRequest(buildable, type: CityNameSearchModel.self) { (serviceResult) in
            switch serviceResult {
            case .success(let model):
                completion(model, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
