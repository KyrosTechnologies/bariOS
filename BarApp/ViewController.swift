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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        print(UserDefaults.standard.object(forKey: "userProfileId") as! NSNumber)
        //        if (UserDefaults.standard.object(forKey: "userProfileId") as! NSNumber != 0) {
        //            DispatchQueue.main.async {
        //                self.login()
        //            }        }
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
            let parameters = ["useremail": txtUserEmailAddress.text!, "password": txtUserPassword.text!] as Dictionary<String, String>
            
            //create the url with URL
            let url = URL(string: "http://192.168.0.111:8080/Bar/rest/userLogin")! //change the url
            
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
                    if let json = try JSONSerialization.jsonObject(with: data, options:.mutableLeaves) as? [String: Any] {
                        print(json)
                        // handle json...
                        if json["message"] as? String == ""
                        {
                            let userList=json["userList"] as! [[String:Any]]
                            print(userList[0]["userprofileid"])
                            let defaults=UserDefaults.standard
                            
                            defaults.set(userList[0]["usercountry"], forKey: "userCountry")
                            defaults.set(userList[0]["useremail"], forKey: "userEmail")
                            defaults.set(userList[0]["userfirstname"], forKey: "userFirstName")
                            defaults.set(userList[0]["userinventorytime"], forKey: "userInventoryTime")
                            defaults.set(userList[0]["userlastname"], forKey: "userLastName")
                            defaults.set(userList[0]["usermobilenumber"], forKey: "userMobileNumber")
                            defaults.set(userList[0]["userofteninventory"], forKey: "userOftenInventory")
                            defaults.set(userList[0]["uservenuename"], forKey: "userVenueName")
                            defaults.set(userList[0]["userprofileid"], forKey: "userProfileId")
                            print(json["userList"] as! [[String:Any]])
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
    //  The converted code is limited by 4 KB.
    //  Upgrade your plan to remove this limitation.
    
    //  Converted with Swiftify v1.0.6341 - https://objectivec2swift.com/
    func getCountryCodeDictionary() -> [AnyHashable: Any] {
        return [
            "IL" : "972",
            "AF" : "93",
            "AL" : "355",
            "DZ" : "213",
            "AS" : "1",
            "AD" : "376",
            "AO" : "244",
            "AI" : "1",
            "AG" : "1",
            "AR" : "54",
            "AM" : "374",
            "AW" : "297",
            "AU" : "61",
            "AT" : "43",
            "AZ" : "994",
            "BS" : "1",
            "BH" : "973",
            "BD" : "880",
            "BB" : "1",
            "BY" : "375",
            "BE" : "32",
            "BZ" : "501",
            "BJ" : "229",
            "BM" : "1",
            "BT" : "975",
            "BA" : "387",
            "BW" : "267",
            "BR" : "55",
            "IO" : "246",
            "BG" : "359",
            "BF" : "226",
            "BI" : "257",
            "KH" : "855",
            "CM" : "237",
            "CA" : "1",
            "CV" : "238",
            "KY" : "345",
            "CF" : "236",
            "TD" : "235",
            "CL" : "56",
            "CN" : "86",
            "CX" : "61",
            "CO" : "57",
            "KM" : "269",
            "CG" : "242",
            "CK" : "682",
            "CR" : "506",
            "HR" : "385",
            "CU" : "53",
            "CY" : "537",
            "CZ" : "420",
            "DK" : "45",
            "DJ" : "253",
            "DM" : "1",
            "DO" : "1",
            "EC" : "593",
            "EG" : "20",
            "SV" : "503",
            "GQ" : "240",
            "ER" : "291",
            "EE" : "372",
            "ET" : "251",
            "FO" : "298",
            "FJ" : "679",
            "FI" : "358",
            "FR" : "33",
            "GF" : "594",
            "PF" : "689",
            "GA" : "241",
            "GM" : "220",
            "GE" : "995",
            "DE" : "49",
            "GH" : "233",
            "GI" : "350",
            "GR" : "30",
            "GL" : "299",
            "GD" : "1",
            "GP" : "590",
            "GU" : "1",
            "GT" : "502",
            "GN" : "224",
            "GW" : "245",
            "GY" : "595",
            "HT" : "509",
            "HN" : "504",
            "HU" : "36",
            "IS" : "354",
            "IN" : "91",
            "ID" : "62",
            "IQ" : "964",
            "IE" : "353",
            "IL" : "972",
            "IT" : "39",
            "JM" : "1",
            "JP" : "81",
            "JO" : "962",
            "KZ" : "77",
            "KE" : "254",
            "KI" : "686",
            "KW" : "965",
            "KG" : "996",
            "LV" : "371",
            "LB" : "961",
            "LS" : "266",
            "LR" : "231",
            "LI" : "423",
            "LT" : "370",
            "LU" : "352",
            "MG" : "261",
            "MW" : "265",
            "MY" : "60",
            "MV" : "960",
            "ML" : "223",
            "MT" : "356",
            "MH" : "692",
            "MQ" : "596",
            "MR" : "222",
            "MU" : "230",
            "YT" : "262",
            "MX" : "52",
            "MC" : "377",
            "MN" : "976",
            "ME" : "382",
            "MS" : "1",
            "MA" : "212",
            "MM" : "95",
            "NA" : "264",
            "NR" : "674",
            "NP" : "977",
            "NL" : "31",
            "AN" : "599",
            "NC" : "687",
            "NZ" : "64",
            "NI" : "505",
            "NE" : "227",
            "NG" : "234",
            "NU" : "683",
            "NF" : "672",
            "MP" : "1",
            "NO" : "47",
            "OM" : "968",
            "PK" : "92",
            "PW" : "680",
            "PA" : "507",
            "PG" : "675",
            "PY" : "595",
            "PE" : "51",
            "PH" : "63",
            "PL" : "48",
            "PT" : "351",
            "PR" : "1",
            "QA" : "974",
            "RO" : "40",
            "RW" : "250",
            "WS" : "685",
            "SM" : "378",
            "SA" : "966",
            "SN" : "221",
            "RS" : "381",
            "SC" : "248",
            "SL" : "232",
            "SG" : "65",
            "SK" : "421",
            "SI" : "386",
            "SB" : "677",
            "ZA" : "27",
            "GS" : "500",
            "ES" : "34",
            "LK" : "94",
            "SD" : "249",
            "SR" : "597",
            "SZ" : "268",
            "SE" : "46",
            "CH" : "41",
            "TJ" : "992",
            "TH" : "66",
            "TG" : "228",
            "TK" : "690",
            "TO" : "676",]
    }
}
