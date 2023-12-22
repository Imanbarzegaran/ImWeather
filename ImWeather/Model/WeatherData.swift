//
//  WeatherData.swift
//  ImWeather
//
//  Created by MacBook Air on 12/13/23.
//

import Foundation

struct WeatherData: Codable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
    let feels_like: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
struct Wind: Codable {
    let speed: Double
}
