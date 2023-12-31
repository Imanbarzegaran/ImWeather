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

let appid = Bundle.main.infoDictionary!["Appid"] as! String

struct WeatherManager {
   
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(appid)&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (city: String) {
        let URLString = "\(weatherURL)&q=\(city)"
        performRequest(with: URLString)
    }
    
    
    func performRequest (with URLString: String) {
        
        if let url = URL(string: URLString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFaileWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
            
        }
    }
    
    func parseJSON (_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decodedData.name
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let description = decodedData.weather[0].description
            let speed = decodedData.wind.speed
            let feels_like = decodedData.main.feels_like
            let humidity = decodedData.main.humidity
            let temp_min = decodedData.main.temp_min
            let temp_max = decodedData.main.temp_max
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, description: description, max: temp_max, min: temp_min, feels: feels_like, windSpeed: speed, humidity: humidity)
           
            return weather
            
        }catch{
            delegate?.didFaileWithError(error: error)
            return nil
        }
        
        
    }
    
}
