//
//  ValueOnHandVC.swift
//  BarApp
//
//  Created by Abhinav on 5/16/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class ValueOnHandVC: DefaultVC,UITableViewDelegate,UITableViewDataSource {

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
        let cell: ValueonhandVCcell = tableView.dequeueReusableCell(withIdentifier: "Valuecell", for: indexPath as IndexPath) as! ValueonhandVCcell
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated:true,completion:nil)
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
