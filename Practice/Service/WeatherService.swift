//
//  WeatherService.swift
//  Practice
//
//  Created by Ramesh Rajendran on 5/5/25.
//

import Foundation
class WeatherService {
    func fetchWeather(for city: String, completion: @escaping (Weather?) -> Void) {
        let apiKey = "7b5a2a3cf83f88b740aac3de0c246649";
        let cityQuery = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityQuery)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                let weather = try? JSONDecoder().decode(Weather.self, from: data)
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
