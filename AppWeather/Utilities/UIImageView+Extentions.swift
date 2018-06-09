//
//  UIImageView+Extentions.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/7/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import UIKit
// load icon tren API
extension UIImageView {
    func download(from urlString: String){
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
