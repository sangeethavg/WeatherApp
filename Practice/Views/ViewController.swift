//
//  ViewController.swift
//  Practice
//
//  Created by Ramesh Rajendran on 4/28/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet var weatherTableview: UITableView!
    let weatherService = WeatherService()
    let cities = ["New York", "London", "Tokyo", "Mumbai"]
    var weatherData: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red;
        weatherTableview.delegate = self;
        weatherTableview.dataSource = self;
        weatherTableview.rowHeight = 150;
        weatherTableview.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        self.fetchWeatherForCities();
//        print(twoSum(ar: [2,7,5,6], sum: 7));
//        print(maxProfit([7,1,5,3,6,4]));
//        print(containsDuplicate(num: [1,2,3,4]));
        
    }
    func fetchWeatherForCities() {
            let group = DispatchGroup()
            weatherData = []

            for city in cities {
                group.enter()
                weatherService.fetchWeather(for: city) { weather in
                    if let weather = weather {
                        self.weatherData.append(weather)
                    }
                    group.leave()
                }
            }

            group.notify(queue: .main) {
                self.weatherTableview.reloadData()
            }
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weather = weatherData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.Temp.text = "\(weather.name): \(weather.main.temp)°C"
        cell.minTemp.text = "\(weather.main.temp_min)°C"
        cell.maxTemp.text = "\(weather.main.temp_max)°C"
        return cell
    }
    
    
    
    
    func twoSum(ar: [Int], sum: Int)-> (Int, Int) {
        //[2,7,5,6] 9 ->(0,1)
        var complements:Dictionary<Int, Int> = Dictionary();
        for (index,element) in ar.enumerated() {
            if let idx = complements[sum-element] {
                return(idx, index);
            }
            else
            {
                complements[element] = index;
            }
        }
       
        return(-1,-1);
        
    }
    func maxProfit(_ prices: [Int]) -> Int {
        var buyDayVal = Int.max;
        var profit = 0;
        for item in prices {
            if item < buyDayVal {
                buyDayVal = item;
            }
            else if(item-buyDayVal > profit) {
                profit = item - buyDayVal;
            }
        }
        return profit;
    }
    func containsDuplicate(num: [Int])->Bool {
        var countDictionary: [Int: Int] = [:];
        for item in num {
            if countDictionary[item] != nil {
                return true;
            }
            countDictionary[item] = 1;
        }
        return false;
    }
    
}

