//
//  WeatherAppCodingExcerciseTests.swift
//  WeatherAppCodingExcerciseTests
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import XCTest
@testable import WeatherAppCodingExcercise

class CityListTests: XCTestCase {

    var httpClient: AppHttpClient?
    var mockSession: MockURLSesion?
    
    override func setUp() {
        mockSession = MockURLSesion()
        self.httpClient = AppHttpClient(mockSession!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWeatherSuccessBuildable() {
        let buildable = CityNameSearchBuildable.urlRequest(cityName: "New York")
        let queryParams = buildable.queryParams
        queryParams.forEach { (param) in
            XCTAssertTrue(param.key == "q")
            XCTAssertTrue(param.value == "New York")

        }
        XCTAssert(buildable.methodType == .get)
        XCTAssertNil(buildable.requestBody)
        XCTAssertEqual(buildable.headers, [:])
    }
    
    func testWeatherAPISuccessResponse() {
        
        let buildable = CityNameSearchBuildable.urlRequest(cityName: "New York")
        let queryParams = buildable.queryParams
        queryParams.forEach { (param) in
            XCTAssertTrue(param.key == "q")
            XCTAssertTrue(param.value == "New York")
            
        }
        XCTAssert(buildable.methodType == .get)
        XCTAssertNil(buildable.requestBody)
        XCTAssertEqual(buildable.headers, [:])
        
        self.mockSession?.nextData = JSONUtility.jsonData(with: "success_response")
        
        self.httpClient?.processAPIRequest(buildable, type: CityNameSearchModel.self, completion: { (serviceResult) in
            switch(serviceResult) {
            case .success(let model):
                XCTAssertNotNil(model)
            case .failure(_):
                break
            }
        })
        
        let resume = self.mockSession!.nextDataTask.resumeWasCalled
        XCTAssertEqual(resume, true)
    }
    
    
    func testWeatherAPIFailureResponse() {
        
        let buildable = CityNameSearchBuildable.urlRequest(cityName: "New York")
        let queryParams = buildable.queryParams
        queryParams.forEach { (param) in
            XCTAssertTrue(param.key == "q")
            XCTAssertTrue(param.value == "New York")
            
        }
        XCTAssert(buildable.methodType == .get)
        XCTAssertNil(buildable.requestBody)
        XCTAssertEqual(buildable.headers, [:])
        
        
        self.mockSession?.nextData = JSONUtility.jsonData(with: "invalid_appid")
        
        self.httpClient?.processAPIRequest(buildable, type: CityNameSearchModel.self, completion: { (serviceResult) in
            switch(serviceResult) {
            case .success(let model):
                XCTAssertNotNil(model)
                XCTAssertNil(model.list)
            case .failure(_):
                break
            }
        })
        
        let resume = self.mockSession!.nextDataTask.resumeWasCalled
        XCTAssertEqual(resume, true)
    }
    
}
