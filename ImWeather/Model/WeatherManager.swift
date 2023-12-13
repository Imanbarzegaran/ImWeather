//
//  WeatherManager.swift
//  ImWeather
//
//  Created by MacBook Air on 12/9/23.
//

import Foundation

protocol WeatherManagerDelegate {
    func didFaileWithError (error: Error)
    func didUpdateWeather (_ weatherManager: WeatherManager, weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d5e422e0aa5a9636a759208fe9de1eb2&units=metric"
    var delegte: WeatherManagerDelegate?
    
    func fetchWeather (city: String) {
        let URLString = "\(weatherURL)&q=\(city)"
        performRequest(with: URLString)
    }
    
    
}
