//
//  settingsVC.swift
//  BarApp
//
//  Created by Apple on 5/5/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class settingsVC: UIViewController {

    @IBOutlet weak var userManagementView: UIView!
    @IBOutlet weak var emailManagementView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target:self ,action:#selector(settingsVC.userMgmtTapped))
        tap.numberOfTapsRequired=1
        tap.numberOfTouchesRequired=1
        userManagementView.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target:self ,action:#selector(settingsVC.emailMgmtTapped))
        tap1.numberOfTapsRequired=1
        tap1.numberOfTouchesRequired=1
        emailManagementView.addGestureRecognizer(tap1)
        
        
        // Do any additional setup after loading the view.
    }
    func userMgmtTapped() {
        self.performSegue(withIdentifier: "goUserMgmt", sender: self)
        
    }
    func emailMgmtTapped() {
        self.performSegue(withIdentifier: "goEmailMgmt", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: UIBarButtonItem) {
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
