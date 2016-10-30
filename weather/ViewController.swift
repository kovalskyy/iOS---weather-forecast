//
//  ViewController.swift
//  weather
//
//  Created by Kacper Kowalski on 27.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherView: WeatherView!
    var weather: Weather!


    override func viewDidLoad() {
        super.viewDidLoad()
       
        weather = Weather(location: URL_LOCATION)
        weather.downloadWeatherDetails {
            self.weatherView.updateWeatherConditions(weather: self.weather)
        }
        
    }



}

