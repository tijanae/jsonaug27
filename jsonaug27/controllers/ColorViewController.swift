//
//  ColorViewController.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var colorTableView: UITableView!
    
    var colorData = [colorInfo]() {
        didSet{
            colorTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTableView.delegate = self
        colorTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData(){
        guard let pathToJSONFile = Bundle.main.path(forResource: "colorData", ofType: "json") else{
            fatalError("Unexpected Error: couldnt find json file")
        }
        let url = URL (fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data (contentsOf: url)
            self.colorData = try Color.getColorData(from: data)
        } catch {
            fatalError("Unexpected Error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else{
            fatalError("Unexpected Error: No identifier in segue")
        }
        
        switch segueIdentifier {
        case "colorMainToDetailSegue":
            guard let colorDetailVC = segue.destination as? ColorDetailViewController else{
                fatalError("Unexpected Error: No VC")
            }
            guard let selectedIndexPath = self.colorTableView.indexPathForSelectedRow else{
                fatalError("Unexpected Error: ")
                }
            colorDetailVC.colorDetailInfo = colorData[selectedIndexPath.row]
        default:
            fatalError("Unexpected Error")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorInfo = colorData[indexPath.row]
        let colorCell = colorTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        colorCell.backgroundColor = UIColor (red: colorInfo.rgb.fraction.r, green: colorInfo.rgb.fraction.g, blue: colorInfo.rgb.fraction.b, alpha: 1)
        colorCell.textLabel?.text = colorInfo.name.value
        return colorCell
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
