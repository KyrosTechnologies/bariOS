//
//  DistributorListVC.swift
//  BarApp
//
//  Created by Apple on 5/15/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class DistributorListVC: DefaultVC,UITableViewDataSource,UITableViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DistributorListCell = tableView.dequeueReusableCell(withIdentifier: "distCell", for: indexPath as IndexPath) as! DistributorListCell
        cell.imgView.image=UIImage(named:"dist2")
        cell.distributorName.text="Distributor Name"
        
        cell.imgView.layer.cornerRadius = 35.0
//        cell.imgView.layer.
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
