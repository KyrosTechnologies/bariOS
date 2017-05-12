//
//  SignUpVC.swift
//  BarApp
//
//  Created by Apple on 5/3/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var btnCountryCode: UIButton!
    @IBOutlet weak var btnVenueName: UIButton!
    @IBOutlet weak var btnCountry: UIButton!
    @IBOutlet weak var btInventoryDuration: UIButton!
    @IBOutlet weak var btnInventoryTime: UIButton!
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var countries: [String] = []
        
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
        
        print(countries)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnArrow(_ sender: AnyObject) {
        if sender as! NSObject == btnCountryCode{
            print("countryCode clicked")
        }
        if sender as! NSObject == btnVenueName{
            print("venuename clicked")
        }
        if sender as! NSObject == btnCountry{
            print("country clicked")
        }
        if sender as! NSObject == btInventoryDuration{
            print("inventoryDuration clicked")
        }
        if sender as! NSObject == btnInventoryTime{
            print("inventorytime clicked")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
