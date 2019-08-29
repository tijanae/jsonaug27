//
//  ColorDetailViewController.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/28/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var colorDetailInfo: colorInfo!

    @IBOutlet weak var colorDetailUIView: UIImageView!
    
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var colorHexLabel: UILabel!
    
    @IBOutlet weak var colorRGBLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorNameLabel.text = ("COLOR NAME: \(colorDetailInfo.name.value)")
        colorHexLabel.text = ("HEX: \(colorDetailInfo.hex.value)")
        colorDetailUIView.backgroundColor = UIColor (red: colorDetailInfo.rgb.fraction.r, green: colorDetailInfo.rgb.fraction.g, blue: colorDetailInfo.rgb.fraction.b, alpha: 1)
        colorRGBLabel.text = ("RGB Values: R: \(colorDetailInfo.rgb.r), G: \(colorDetailInfo.rgb.g), B: \(colorDetailInfo.rgb.b)")

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
