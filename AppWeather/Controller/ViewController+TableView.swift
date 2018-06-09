//
//  ViewController+TableView.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/7/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import UIKit
// UITableViewDelegate + UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.dayLable.text = String(forecastDay[indexPath.row].date_epoch.getCurrentDateTime())
        cell.iconView.download(from: forecastDay[indexPath.row].icon)
        cell.temperatureMax.text = String(forecastDay[indexPath.row].maxtemp_c) + "ºC"
        cell.temperatureMin.text = String(forecastDay[indexPath.row].mintemp_c) + "ºC"
        
        return cell
    }
}
