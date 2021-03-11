//
//  NetworkConnectivity.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import Foundation
import Network

class NetworkConnectivity {
    
    static var isConnected = false
    
    class func startMonitoringInternetConnectivity() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isConnected = true
                print("We're connected!")
            } else {
                isConnected = false
                print("No connection.")
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}
