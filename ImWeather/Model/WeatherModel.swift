//
//  WeatherModel.swift
//  ImWeather
//
//  Created by MacBook Air on 12/13/23.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let description: String
   
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    
    
    var conditionIcon: String {
        switch conditionId {
        case 200...232 :
           return "11d"
        case 300...321:
           return "9d"
        case 500...504:
           return "10d"
        case 511:
           return "13d"
        case 520...531:
           return "09d"
        case 600...622:
          return "13d"
        case 701...781:
          return "50d"
        case 800:
          return "01d"
        case 801:
          return "02d"
        case 802:
          return "03d"
        case 803...804:
          return "04d"
        default:
          return "01d"
          
        }
    }
    
    var conditionImage: String {
        switch conditionIcon {
        case "01d":
            return "sunny"
        case "02d":
            return "partcloudy"
        case "03d":
            return "cloudy"
        case "04d":
            return "cloudy"
        case "09d":
            return "rain"
        case "10d":
            return "rain"
        case "11d":
            return "thunderstorm"
        case "13d":
            return "snow"
        case "50d":
            return "fog"
            
        default:
            return "sunny"
        }
    }
     
}
