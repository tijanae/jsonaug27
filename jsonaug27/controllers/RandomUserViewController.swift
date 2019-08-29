//
//  RandomUserViewController.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
  
    @IBOutlet weak var randoUserTableView: UITableView!
    
    var userData = [UserInfo](){
        didSet{
            randoUserTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        randoUserTableView.delegate = self
        randoUserTableView.dataSource = self
       
        // Do any additional setup after loading the view.
    }
    
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "userData", ofType: "json") else{
            fatalError("Unexpected Error: couldnt find json file")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do{
            let data = try Data (contentsOf: url)
            self.userData = try User.getUserData(from: data)
        } catch{
            fatalError("Unexpected Error")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userInfo = userData[indexPath.row]
        let userCell = randoUserTableView.dequeueReusableCell(withIdentifier: "userDataCell", for: indexPath)
        userCell.textLabel?.text = ("\(userInfo.name.title.capitalized) \(userInfo.name.first.capitalized) \(userInfo.name.last.capitalized)")
        userCell.detailTextLabel?.text = userInfo.email
        return userCell
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
