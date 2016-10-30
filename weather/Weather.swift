//
//  Weather.swift
//  weather
//
//  Created by Kacper Kowalski on 28.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    private var _day: String!
    private var _type: String!
    private var _location: String!
    private var _temp: String!
    private var _humidity: String!
    private var _wind: String!
    private var _pressure: String!
    private var _backGroundStyle: backGroundStyle!
    
    enum backGroundStyle {
        case clouds
        case sun
        case thunder
        case rain
        case snow
    
        }
    
    var backGround: backGroundStyle {
        return _backGroundStyle

    }
    
    var day: String {
        if _day == nil {
            _day = ""
    }
        return _day
    }
    
    var type: String {
        if _type == nil {
            _type = ""
    }
        return _type
    }
    
    var temp: String {
       if _temp == nil {
            _temp = ""
    }
        return _temp
    }
    
    var humidity: String {
        if _humidity == nil {
            _humidity = ""
    }
        return _humidity
    }
    
    var wind: String {
        if _wind == nil {
            _wind = ""
    }
        return _wind
    }
    
    var pressure: String {
        if _pressure == nil {
            _pressure = ""
    }
        return _pressure
    }
    
    var location: String {
        if _location == nil {
            _location = ""
    }
        return _location
    }
    
    init(location: String) {
        self._location = location
        
        
    }
    
    func downloadWeatherDetails(_completed: @escaping donwloadComplete) {
        
        let url = URL(string: "\(URL_WEATHER)\(_location!)\(URL_METRICUNITS)\(URL_KEY)")!
        
        Alamofire.request(url).responseJSON { response in
            debugPrint(response)
            if let json = response.result.value {
                print("JSON: \(json)")
                
                if let dict = response.result.value as? Dictionary <String, AnyObject> {
                    
                    if let weatherDetails = dict["main"] as? Dictionary <String, AnyObject> {
                        
                        if let humidity = weatherDetails["humidity"] as? Double {
                            self._humidity = "\(Int(round(humidity)))"
                        }
                        
                        if let pressure = weatherDetails["pressure"] as? Double {
                            self._pressure = "\(Int(round(pressure)))"
                            
                        }
                        
                        if let temperature = weatherDetails["temp"] as? Double {
                            self._temp = "\(Int(round(temperature)))"
                        }
                        print(self._humidity)
                        print(self._pressure)
                        print(self._temp)
                        
                    }
                    
                    if let wind = dict["wind"] as? Dictionary <String, Double> {
                        
                        if let windspeed = wind["speed"] {
                            self._wind = "\(Int(round(windspeed)))"
                        }
                        print(self._wind)
                    }
                    
                    if let time = dict["dt"] as? Double {
                        
                        let date = Date(timeIntervalSince1970: time)
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "EEEE"
                        self._day = dateFormatter.string(from: date)
                    }
                        print(self._day)

                    if let weatherDict = dict["weather"] as? [Dictionary<String, AnyObject>] {
                        
                        if let weatherDesc = weatherDict[0]["description"] as? String {
                            self._type = weatherDesc
                        }
                        print(self._type)
                        
                        
                        if let mainWeather = weatherDict[0]["main"] as? String {
                            switch mainWeather {
                                case "Thunderstorm":
                                    self._backGroundStyle = backGroundStyle.thunder
                                case "Drizzle":
                                    self._backGroundStyle = backGroundStyle.rain
                                case "Rain":
                                    self._backGroundStyle = backGroundStyle.rain
                                case "Snow":
                                    self._backGroundStyle = backGroundStyle.snow
                                case "Atmosphere":
                                    self._backGroundStyle = backGroundStyle.clouds
                                case "Clear":
                                    self._backGroundStyle = backGroundStyle.sun
                                case "Clouds":
                                    self._backGroundStyle = backGroundStyle.clouds
                                case "Extreme":
                                    self._backGroundStyle = backGroundStyle.thunder
                            default:
                                self._backGroundStyle = backGroundStyle.sun
                            
                            }
       
                    }
 
                    }
        
                }
               
            }
             _completed()
        }
    }
}
