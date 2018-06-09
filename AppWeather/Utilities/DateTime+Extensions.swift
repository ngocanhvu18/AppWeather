//
//  DateTime.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/8/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import UIKit
extension TimeInterval {
    func getCurrentDateTime() -> String{
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        formater.locale = Locale(identifier: "vi-VN")
        let date = formater.string(from: Date(timeIntervalSince1970: self))
        let today = formater.string(from: Date())
        return date == today ? "Hôm nay" : date
    }
}

extension String {
    func converDate() -> String {
        var time = "-1"
        if let timeConvert = Int(self) {
            time = String(timeConvert/100) + ":00"
        }
        return time
    }
}
