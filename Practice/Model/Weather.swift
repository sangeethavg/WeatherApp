//
//  Weather.swift
//  Practice
//
//  Created by Ramesh Rajendran on 5/5/25.
//

import Foundation
struct Weather: Codable {
    let name: String
    let main: Main
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}
