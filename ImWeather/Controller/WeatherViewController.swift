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
    
    
    
    
    var weatherManager = WeatherManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
        
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
            self.conditionImage.image = UIImage(named: "")
            
        }
    }
    
    func didFaileWithError(error: Error) {
        print(error)
    }
}


    


