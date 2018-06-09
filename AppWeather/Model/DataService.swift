//
//  DataService.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/1/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import UIKit

typealias DICT = Dictionary<AnyHashable, Any>

class DataService {
    static let share : DataService = DataService()
    
    func downloadWeatherAPI(complete: @escaping(Weather?)->Void){
        var weathers: Weather?
        guard let url = URL(string: "http://api.apixu.com/v1/forecast.json?key=5c6a5882f54e46c99d713906183105&q=Hanoi&days=7&lang=vi") else { return  }
        let urlRequset = URLRequest(url: url)
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: urlRequset, completionHandler: { (data, respons, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let  dataWeather = data else{return}
                do{
                    guard let results = try JSONSerialization.jsonObject(with: dataWeather, options: .mutableContainers) as? DICT else {return}
                    if let weatherData = Weather(dictionary: results) {
                        weathers = weatherData
                    }
                    DispatchQueue.main.async {
                        complete(weathers)
                    }
                    
                }
                catch{
                    print(error.localizedDescription)
                }
            })
            task.resume()
            
        }
    }
    
    func downloadHourAPI(complete: @escaping ([Hour])->Void){
        var hours: [Hour] = []
        guard let url = URL(string: "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a2ffd070d499455a9df93710180706&q=Hanoi&format=json&num_of_days=1&tp=1") else { return  }
        let urlRequest = URLRequest(url: url)
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard error == nil else{
                    print(error!.localizedDescription)
                    return
                }
                guard let aDataHour = data else{return}
                do{
                    guard let result = try JSONSerialization.jsonObject(with: aDataHour, options: .mutableContainers) as? DICT else{return}
                    guard let dataWeather = result["data"] as? DICT else { return }
                    guard let weather = dataWeather["weather"] as? [DICT] else { return }
                    guard let hourly = weather[0]["hourly"] as? [DICT] else { return }
                    for objectHourly in hourly {
                        if let hourData = Hour(dictionary: objectHourly) {
                            hours.append(hourData)
                        }
                    }
                    DispatchQueue.main.async {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "HH"
                        dateFormatter.locale = Locale(identifier: "vi_VI")
                        let current = Int(dateFormatter.string(from: Date()))!
                        
                        hours = hours.filter({ hour -> Bool in
                            return Int(hour.time)!/100 >= current
                        })
                        complete(hours)
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
    }
}
