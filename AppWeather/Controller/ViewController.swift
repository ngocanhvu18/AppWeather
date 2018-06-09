//
//  ViewController.swift
//  AppWeather
//
//  Created by Ngọc Anh on 6/1/18.
//  Copyright © 2018 Ngọc Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let padding: CGFloat = 10
    var numberOfItem: CGFloat = 3
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var maxToday: UILabel!
    @IBOutlet weak var minToday: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var minC: UILabel!
    @IBOutlet weak var maxC: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var toDay: UILabel!
    func ucln(a: Int, b: Int) {
        
    }
    
    var forecastDay: [ForecastDay] = []
    var hoursDay: [Hour] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set size Item
        let width = (view.frame.width - 2 * padding - (numberOfItem - 1)*padding)/numberOfItem
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = padding
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.scrollDirection = .horizontal
        
        //Load du lieu
    
       
        DataService.share.downloadHourAPI {[unowned self] (hours) in
            
            self.hoursDay = hours
            self.collectionView.reloadData()
        }
        
      
        DataService.share.downloadWeatherAPI { [unowned self] (weather) in
            if weather != nil {
                let current = weather!.forecastday[0]
                self.maxToday.text = String(weather!.forecastday[0].maxtemp_c)
                self.minToday.text = String(weather!.forecastday[0].mintemp_c)
                self.cityLabel.text = weather!.name
                self.weatherLabel.text = weather!.country
                self.temperatureLabel.text = String(weather!.temp_c) + "ºC"
                self.forecastDay = weather!.forecastday
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

