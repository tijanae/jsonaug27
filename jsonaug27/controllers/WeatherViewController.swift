//
//  WeatherViewController.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var weatherTableView: UITableView!
    
    var weatherData = [listInfo]() {
        didSet {
            weatherTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        guard let pathToJSONFile = Bundle.main.path(forResource: "weatherData", ofType: "json") else{
            fatalError("Unexpected Error: couldnt find json file")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data(contentsOf: url)
            self.weatherData = try Weather.getWeatherData(from: data)
        }catch{
            print(error)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else{
            fatalError("Unexpected Error: No Identifier in segue")
        }
        
        switch segueIdentifier {
        case "weatherMainToDetailSegue":
            guard let weatherDetailsVc = segue.destination as? WeatherDetailViewController else{
                fatalError("Unexpected Error: No VC")
            }
            guard let selectedIndexPath = self.weatherTableView.indexPathForSelectedRow else{
                fatalError("Unexpected Error: No Row Selected")
            }
            weatherDetailsVc.weatherDetailInfo = weatherData[selectedIndexPath.row]
            
        default:
            fatalError("Unexpected Identifier")
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherInfo = weatherData[indexPath.row]
        let weatherCell = weatherTableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        weatherCell.textLabel?.text = weatherInfo.name
        return weatherCell
    }
    
    

}
