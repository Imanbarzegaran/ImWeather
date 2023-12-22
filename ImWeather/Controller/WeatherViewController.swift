//
//  WeatherViewController.swift
//  ImWeather
//
//  Created by MacBook Air on 12/9/23.
//

import UIKit
import CoreLocation


class WeatherViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionIcon: UIImageView!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var imWeatherBackground: UIImageView!
    @IBOutlet weak var weatherBoard: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var feelView: UIView!
    @IBOutlet weak var feelsLabel: UILabel!
    
    
    
    
    var weatherManager = WeatherManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
        weatherBoard.layer.cornerRadius = 15
        weatherBoard.layer.masksToBounds = true
        detailView.layer.cornerRadius = 15
        detailView.layer.masksToBounds = true
        feelView.layer.cornerRadius = 4
        feelView.layer.masksToBounds = true
        
    }
}

extension WeatherViewController: UITextFieldDelegate {

    @IBAction func searchPerssed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            textField.placeholder = "type Somthing"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(city: city)
        }
        searchTextField.text = ""
    }
}

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.locationLabel.text = weather.cityName
            self.conditionLabel.text = weather.description
            self.tempLabel.text = weather.temperatureString
           
         self.conditionIcon.image = UIImage(named: "\(weather.conditionIcon)")
            self.imWeatherBackground.image = UIImage(named: weather.conditionBackground)
            self.conditionImage.image = UIImage(named: weather.conditionImage)
            self.maxLabel.text = weather.temMax
            self.minLabel.text = weather.tempMin
            self.speedLabel.text = weather.speedString
            self.humidityLabel.text = weather.humidityString
            self.feelsLabel.text = weather.feelsString
        }
    }
    
    func didFaileWithError(error: Error) {
        print(error)
    }
}


    


