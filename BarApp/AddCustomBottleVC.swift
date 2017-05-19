//
//  AddCustomBottleVC.swift
//  BarApp
//
//  Created by Apple on 5/17/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class AddCustomBottleVC: DefaultVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addButtonClicked(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let controller:UIAlertController = UIAlertController(title:"",message:"Select Type",preferredStyle:.alert)
        controller.addAction(UIAlertAction(title:"Keg",style:.cancel){ action in
            defaults.set("KEG",forKey:"CustomType")
            self.performSegue(withIdentifier: "goCamera", sender: self)

        });
        controller.addAction(UIAlertAction(title:"Bottle",style:.default){ action in
            defaults.set("BOTTLE",forKey:"CustomType")
            self.performSegue(withIdentifier: "goCamera", sender: self)

            });
        self.present(controller, animated:true, completion:nil)    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

