//
//  CityListViewController.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    var cityListViewModel: CityListViewModel?
    
    override func viewDidLoad() {
        cityTableView.backgroundColor = .clear
        navigationController?.navigationBar.isHidden = false
        super.viewDidLoad()
    }
}
