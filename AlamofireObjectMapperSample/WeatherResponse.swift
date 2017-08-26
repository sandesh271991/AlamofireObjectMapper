import ObjectMapper

class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [ Forecast]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["data"]
        threeDayForecast <- map["three_day_forecast"]
    }
}


class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}

