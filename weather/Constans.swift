//
//  Constans.swift
//  weather
//
//  Created by Kacper Kowalski on 28.10.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import Foundation
import UIKit

let URL_WEATHER = "http://api.openweathermap.org/data/2.5/weather?q="
let URL_LOCATION = "Poznan"
let URL_KEY = "&APPID=3091ce691cfb8a58e9b952a92eb1b7b0"
let URL_METRICUNITS = "&units=metric"

let CLOUDS_RAIN_SNOW_COLOR = UIColor(red: 20/255, green: 23/255, blue: 87/255, alpha: 1)
let SUN_COLOR = UIColor(red: 198/255, green: 66/255, blue: 129/255, alpha: 1)
let THUNDER_COLOR = UIColor(red: 72/255, green: 75/255, blue: 167/255, alpha: 1)

typealias donwloadComplete = () -> ()
