//
//  WeatherView.swift
//  weather
//
//  Created by Kacper Kowalski on 28.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var temperatureUnit: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var pressure: UILabel!
    
    var weather: Weather!
    
    func updateWeatherConditions(weather: Weather) {
        
       weatherImg.image = UIImage(named: "\(weather.backGround)")
       day.text = weather.day.uppercased()
       type.text = weather.type.uppercased()
       location.text = weather.location.uppercased()
       temperature.text = weather.temp
       humidity.text = "Humidity: \(weather.humidity)"
       wind.text = "Wind: \(weather.wind)"
       pressure.text = "Pressure: \(weather.pressure)"
        
        switch weather.backGround {
            
        }
        
        
    }

    func changeLblColor(color: UIColor) {
        
        day.textColor = color
        type.textColor = color
        location.textColor = color
        temperature.textColor = color
        temperatureUnit.textColor = color
        humidity.textColor = color
        wind.textColor = color
        pressure.textColor = color
        
    
}


        
    
}
