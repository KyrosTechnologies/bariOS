//
//  ViewController.swift
//  BarApp
//
//  Created by Apple on 4/28/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit
import ReachabilitySwift

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var txtUserEmailAddress: ACFloatingTextfield!
    @IBOutlet weak var txtUserPassword: ACFloatingTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.btnSignIn.layer.borderColor=UIColor.white.cgColor
        self.btnSignIn.layer.borderWidth=0.5
        
        label.alpha=0.0
        
        UIView.animate(withDuration: 1.0, animations: {
            self.label.alpha=1.0;
        }) { (true) in
            
        };
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
        
        
        
        UIApplication.shared.keyWindow?.rootViewController = drawerController;
        
        
    }
    
    @IBAction func btnSignIn(_ sender: AnyObject) {
        
        let reach = Reachability()
        if txtUserEmailAddress.text == "" || txtUserPassword.text == ""
        {
            //Show Alert
            let alert:UIAlertController=UIAlertController(title: nil, message: "Kindly Enter all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if reach?.currentReachabilityStatus == .notReachable
        {
            let alert:UIAlertController=UIAlertController(title: nil, message: "No internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }else{
            let parameters = ["useremail": txtUserEmailAddress.text, "password": txtUserPassword.text] as! Dictionary<String, String>
            
            //create the url with URL
            let url = URL(string: "http://192.168.0.113:8080/Bar/rest/userLogin")! //change the url
            
            //create the session object
            let session = URLSession.shared
            
            //now create the URLRequest object using the url object
            var request = URLRequest(url: url)
            request.httpMethod = "POST" //set http method as POST
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        // handle json...
                        if json["message"] as? String == ""
                        {
                            let defaults=UserDefaults.standard
                            defaults.set(json["userList.usercountry"], forKey: "userCountry")
                            defaults.set(json["userList.useremail"], forKey: "useremail")
                            defaults.set(json["userList.userfirstname"], forKey: "userfirstname")
                            defaults.set(json["userList.userinventorytime"], forKey: "userinventorytime")
                            defaults.set(json["userList.userlastname"], forKey: "userlastname")
                            defaults.set(json["userList.usermobilenumber"], forKey: "usermobilenumber")
                            defaults.set(json["userList.userofteninventory"], forKey: "userofteninventory")
                            defaults.set(json["userList.uservenuename"], forKey: "uservenuename")
                            defaults.set(json["userList.userprofileid"], forKey: "userprofileid")
                            
                            DispatchQueue.main.async {
                                self.login()
                            }
                            
                        }else{
                            DispatchQueue.main.async {
                                let alert:UIAlertController=UIAlertController(title: nil, message: json["message"] as? String  , preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }
                            
                        }
                        
                    }
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            task.resume()
            
        }
}
}
