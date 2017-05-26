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
            countries.append(id)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
