//
//  ViewController.swift
//  BarApp
//
//  Created by Apple on 4/28/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtUserEmailAddress: ACFloatingTextfield!
    @IBOutlet weak var txtUserPassword: ACFloatingTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.btnSignIn.layer.borderColor=UIColor.white.cgColor
        self.btnSignIn.layer.borderWidth=1
//        txtUserEmailAddress.selectedPlaceHolderColor=UIColor(colorLiteralRed: 161/255.0, green: 161/255.0, blue: 161/255.0, alpha: 1.0)
//        txtUserPassword.selectedPlaceHolderColor=UIColor(colorLiteralRed: 161/255.0, green: 161/255.0, blue: 161/255.0, alpha: 1.0)
//        
//        txtUserEmailAddress.placeHolderColor=UIColor.white
//        txtUserPassword.placeHolderColor=UIColor.white
//        
//        txtUserEmailAddress.errorLineColor=UIColor.white
//        txtUserPassword.errorLineColor=UIColor.white
        
//        txtUserEmailAddress.btmLineSelectionColor=UIColor(colorLiteralRed: 161/255.0, green: 161/255.0, blue: 161/255.0, alpha: 1.0)
//        txtUserPassword.btmLineSelectionColor=UIColor(colorLiteralRed: 161/255.0, green: 161/255.0, blue: 161/255.0, alpha: 1.0)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func login(){
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainController") as! MainViewController
        let drawerViewController = mainStoryboard.instantiateViewController(withIdentifier: "drawerViewController") as! DrawerViewController
        let drawerController     = KYDrawerController(drawerDirection: .left, drawerWidth: (3*mainViewController.view.frame.size.width)/4)
        drawerController.mainViewController = UINavigationController(
            rootViewController: mainViewController
        )
        drawerController.drawerViewController = drawerViewController
        
        /* Customize
         drawerController.drawerDirection = .Right
         drawerController.drawerWidth     = 200
         */
        
        UIApplication.shared.keyWindow?.rootViewController = drawerController;


    }

    @IBAction func btnSignIn(_ sender: AnyObject) {
        self.login()
    }
}

