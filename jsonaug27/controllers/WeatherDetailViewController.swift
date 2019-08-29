//
//  WeatherDetailViewController.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/28/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var weatherDetailInfo: listInfo!

    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var weatherCityLabel: UILabel!
    
    @IBOutlet weak var weatherTempLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherCityLabel.text = weatherDetailInfo.name
        weatherTempLabel.text = String(weatherDetailInfo.main.temp)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
