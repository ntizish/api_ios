//
//  ArtistsVC.swift
//  Profile
//
//  Created by Danil Perednja on 03.12.2023.
//

import UIKit

class ArtistsVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var artistsArray: [Artist] = []
    
    var tableView: UITableView!
    
    let artistLabel: UILabel = {
        let control = UILabel()
        control.text = "..."
        control.textAlignment = .center
        control.backgroundColor = .lightGray
        control.numberOfLines = 0
        return control
    }()
    
    let artistView: UIImageView = {
        let image = UIImage(named: "DefaultAvatar")
        let control = UIImageView(image: image)
        control.layer.cornerRadius = Constants.inset / 2
        control.layer.masksToBounds = true
        return control
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromServer()
        setupWindow()
//        print(weatherArray.count)
//        getForecast("Paris")
        setupTableView()
    }

    func setupWindow() {
        view.addSubview(artistLabel)
        view.addSubview(artistView)
        artistLabel.pin(to: self.view, Constants.inset)
        artistView.pinCenterX(to: view)
        artistView.setWidth(150)
        artistView.setHeight(150)
        artistView.pinTop(to: view, Constants.inset * 4)
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
    
    func fetchDataFromServer() {
        // Replace the URL with the actual URL of your server endpoint
        if let url = URL(string: "http://localhost:3000/api/v1/artists.json") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Check for errors
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                // Check for a successful response
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Error: Invalid response")
                    return
                }
                
                // Parse the data
                if let data = data {
                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        self.getArtistsFromData(data)
//                        print("Received data: \(json)")
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    func getArtistsFromData(_ data: Data) {
        do {
                // Parse the JSON data into a dictionary
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                    // Iterate over the dictionary
//            for i in json as! [String: Any] {
//                print(i)
//            }
            print(json)
                    
            } catch {
                print("Error parsing JSON: \(error)")
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsArray.count
//        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as UITableViewCell?
        cell?.textLabel?.text = artistsArray[indexPath.row].name
        return cell!
    }
    

    
    
}
