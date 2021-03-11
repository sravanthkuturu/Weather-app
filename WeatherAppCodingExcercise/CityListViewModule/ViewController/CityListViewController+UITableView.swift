//
//  CityListViewController+UITableView.swift
//  WeatherAppCodingExcercise
//
//  Created by Sravanth Kuturu on 11/03/2021.
//  Copyright © 2021 CodingExcercise. All rights reserved.
//

import UIKit

extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityListViewModel?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherCell.name, for: indexPath) as? CityWeatherCell else {
            return UITableViewCell()
        }
        cell.setup(list: cityListViewModel?.list?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: CityWeatherDetailVC.name) as? CityWeatherDetailVC else {
            return
        }
        let detailVM = CityWeatherDetailViewModel(list: cityListViewModel?.list?[indexPath.row])

        let backItem = UIBarButtonItem()
        backItem.title = cityListViewModel?.cityName
        self.navigationItem.backBarButtonItem = backItem
        controller.cityWeatherDetailVM = detailVM
        navigationController?.pushViewController(controller, animated: true)
    }
}
