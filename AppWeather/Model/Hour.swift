//
//  24hour.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/7/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import Foundation

class Hour {
    var time : String
    var tempC: String
    var value: String
    init?(dictionary: DICT) {
        
       guard let time = dictionary["time"] as? String else { return nil }
        guard let tempC = dictionary["tempC"] as? String else { return nil }
        guard let weatherIconUrl = dictionary["weatherIconUrl"] as? [DICT] else { return nil }
        guard let value = weatherIconUrl[0]["value"] as? String else { return nil }
        self.time = time
        self.tempC = tempC
        self.value = value
    }
}
