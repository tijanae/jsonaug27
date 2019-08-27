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
    
    var weatherData = [Weather]()
    
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
//            let data = try Data(contentsOf: url)
//            let weatherDataFromJSON try Weather
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
