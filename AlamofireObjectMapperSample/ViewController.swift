//
//  ViewController.swift
//  AlamofireObjectMapperSample
//
//  Created by Javal Nanda on 5/1/17.
//  Copyright © 2017 Javal Nanda. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    
    var projects:[Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // fetchWeatherData()
        fetchData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Example 1
    func fetchWeatherData(){
        
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(URL).responseObject { (response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value  //getting JSON response here
            print(weatherResponse?.location)
            
            if let threeDayForecast = weatherResponse?.threeDayForecast {
                for forecast in threeDayForecast {
                    print(forecast.day)
                    print(forecast.temperature)
                }
            }
        }
    }
    
 //Example 2 -- Using KeyPath
  func fetchData(){
     let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/2ee8f34d21e8febfdefb2b3a403f18a43818d70a/sample_keypath_json"
    
     Alamofire.request(URL).responseObject(keyPath: "data") { (response: DataResponse<WeatherResponse>) in
     
     let weatherResponse = response.result.value
     print(weatherResponse?.location)
     
     if let threeDayForecast = weatherResponse?.threeDayForecast {
     for forecast in threeDayForecast {
     print(forecast.day)
     print(forecast.temperature)
     }
     }
     }
    }
}

