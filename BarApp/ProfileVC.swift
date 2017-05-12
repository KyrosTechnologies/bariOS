//
//  ProfileVC.swift
//  BarApp
//
//  Created by Apple on 5/5/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var editProfileView: UIView!
    @IBOutlet weak var changePasswordView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let tap = UITapGestureRecognizer(target:self ,action:#selector(ProfileVC.EditProfileTapped))
        tap.numberOfTapsRequired=1
        tap.numberOfTouchesRequired=1
        editProfileView.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target:self ,action:#selector(ProfileVC.ChangePasswordTapped))
        tap1.numberOfTapsRequired=1
        tap1.numberOfTouchesRequired=1
        changePasswordView.addGestureRecognizer(tap1)
        

        // Do any additional setup after loading the view.
    }
    func EditProfileTapped() {
        self.performSegue(withIdentifier: "goEditProfile", sender: self)
        
    }
    func ChangePasswordTapped() {
        self.performSegue(withIdentifier: "goChangePassword", sender: self)
        
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
     self.dismiss(animated:true ,completion:nil)
     
     self.dismiss(animated:true ,completion:nil)
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
