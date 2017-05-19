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
        
        cell.outerview.clipsToBounds = false
        cell.outerview.layer.shadowColor = UIColor.black.cgColor
        cell.outerview.layer.shadowOpacity = 1
        cell.outerview.layer.shadowOffset = CGSize.zero
        cell.outerview.layer.shadowRadius = 30
        cell.outerview.layer.shadowPath = UIBezierPath(roundedRect: cell.outerview.bounds, cornerRadius: 30).cgPath
        
        
        cell.imgView.layer.cornerRadius = 30
        cell.imgView.clipsToBounds = true
        //        cell.imgView.layer.borderWidth=0.5
        //        cell.imgView.layer.borderColor=UIColor.brown.cgColor
        
        
        //
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.dismiss(animated:true ,completion:nil)
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
