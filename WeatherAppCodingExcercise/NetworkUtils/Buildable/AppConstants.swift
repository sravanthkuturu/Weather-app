//  Created by Sravanth Kuturu 

import Foundation

struct QueryParms {
    let key, value: String
}

struct AppConstant {
    static var appId: String {
        return "65d00499677e59496ca2f318eb68c049"
    }
    static var apiPath: String {
        return "/data/2.5/forecast"
    }
    static var host: String {
        return "api.openweathermap.org"
    }
    static var scheme: String {
        return "https"
    }
}

