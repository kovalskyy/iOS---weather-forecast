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
    private var _backGroundStyle: BackgroundStyle!
    
    
    
    
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
    
    
    
    
    
    
    
    
    
    
    
    
}
