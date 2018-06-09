//
//  ViewController+CollectionView.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/7/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import UIKit

// UICollectionViewDelegate + UICollectionViewDataSource
extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hoursDay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.icon.download(from: hoursDay[indexPath.row].value)
        cell.hour.text = indexPath.row == 0 ? "Bây giờ" : hoursDay[indexPath.row].time.converDate()
        cell.tempeture.text = hoursDay[indexPath.row].tempC + "ºC"
        return cell
    }
    
    
}

