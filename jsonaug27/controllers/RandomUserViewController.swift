//
//  RandomUserViewController.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController, UITableViewDelegate {
    
    

    @IBOutlet weak var randoUserTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randoUserTableView.delegate = self
        //randoUserTableView.dataSource = self
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
