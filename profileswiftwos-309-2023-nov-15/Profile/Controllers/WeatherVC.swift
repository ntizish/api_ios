//
//  WeatherVC.swift
//  Profile
//  Created by Студент on 15.11.2023.
//
import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    let API_KEY = "ba589b1def85d5a1a79673472d9a4bd2"
    let cities: [String] = ["Moscow", "New York", "Paris"]
    var weatherArray: [WeatherCity] = []
    var weatherCity: WeatherCity?
    
    var tableView: UITableView!
    
    let weatherLabel: UILabel = {
        let control = UILabel()
        control.text = "..."
        control.textAlignment = .center
        control.backgroundColor = .lightGray
        control.numberOfLines = 0
        return control
    }()
    
    let weatherView: UIImageView = {
        let image = UIImage(named: "DefaultAvatar")
        let control = UIImageView(image: image)
        control.layer.cornerRadius = Constants.inset / 2
        control.layer.masksToBounds = true
        return control
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWindow()
        for city in cities {
            getForecast(city)
        }
//        print(weatherArray.count)
//        getForecast("Paris")
        setupTableView()
    }

    func setupWindow() {
        view.addSubview(weatherLabel)
        view.addSubview(weatherView)
        weatherLabel.pin(to: self.view, Constants.inset)
        weatherView.pinCenterX(to: view)
        weatherView.setWidth(150)
        weatherView.setHeight(150)
        weatherView.pinTop(to: view, Constants.inset * 4)
    }

    func getForecast(_ s: String = "New York") {
        if s == "" {
            weatherLabel.text = "City name is empty."
            return
        }
        
        var weather = ""
//        var urlError = false
//        print("http://api.weatherstack.com/current?access_key=\(API_KEY)&query=\(s.replacingOccurrences(of: " ", with: "-"))")
        let url = URL(string: "http://api.weatherstack.com/current?access_key=\(API_KEY)&query=\(s.replacingOccurrences(of: " ", with: "-"))")
        
        if url != nil {
            var request = URLRequest(url: url!)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "GET"
            
            var urlError = false
            
            let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    do {
                        let city = try decoder.decode(WeatherCity.self, from: data!)
                        
                        weather += city.request.query + "\n "
                        weather += "Temperature: \(city.current.temperature)\n"
                        weather += "Pressure: \(city.current.pressure)\n"
                        weather += "Humidity: \(city.current.humidity)\n"
                        weather += city.current.weather_descriptions[0]
                        
                        let imageUrl = city.current.weather_icons[0]
                        weatherView.imageFromUrl(urlString: imageUrl)
                        self.weatherCity = city
                    } catch {
//                        self.weatherLabel.text = "Error in JSON parsing."
                        weather = "Error in JSON parsing."
                    }

                } else {
                    urlError = true
                    weather = "Error occured."
                }
                
                DispatchQueue.main.async {
                    if urlError {
                        self.weatherLabel.text = "Error occured."
                    } else {
                        self.weatherLabel.text = weather
                        self.weatherArray.append(self.weatherCity!)
                        print(self.weatherArray.count)
                        self.tableView.reloadData()
                        
                    }
                }
            }
            task.resume()
        } else {
            self.weatherLabel.text = "Was not able to find weather forecast for \(s)."
        }
    }

    
    func setupTableView() {
        view.backgroundColor = UIColor.red
        let rect = CGRect(x: Constants.inset, y: Constants.inset, width: view.frame.width - Constants.inset * 2, height: view.frame.height - Constants.inset * 2)
        tableView = UITableView(frame: rect)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellId)
//        tableView.register(MyTVC.self, forCellReuseIdentifier: Constants.cellId)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = view.frame.height / 12
        tableView.backgroundColor = UIColor.green
        tableView.translatesAutoresizingMaskIntoConstraints = false // !
        tableView.layer.cornerRadius = view.frame.height / 36
        tableView.layer.masksToBounds = true
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
//        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as UITableViewCell?
        cell?.textLabel?.text = weatherArray[indexPath.row].request.query
        return cell!
    }
    

    
    
}
