//
//  ValidationTests.swift
//  WeatherAppCodingExcerciseTests
//
//  Created by Sravanth Kuturu on 16/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import XCTest
@testable import WeatherAppCodingExcercise

class ValidationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTextFieldInput() {
       let cityNameViewModel = CityNameSearchViewModel()
        let emptyResult = cityNameViewModel.validateTextField(value: nil)
        XCTAssertTrue(!emptyResult.0)
        let result = cityNameViewModel.validateTextField(value: "New York")
        XCTAssertTrue(result.0)
    }

}
