//
//  PurchaseStockVC.swift
//  BarApp
//
//  Created by Apple on 5/10/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class PurchaseStockVC: DefaultVC,UITableViewDataSource,UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PurchaseStockCell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! PurchaseStockCell
    return cell
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
