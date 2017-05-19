//
//  MinMaxSelectVC.swift
//  BarApp
//
//  Created by Apple on 5/17/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class MinMaxSelectVC: DefaultVC {
    
    @IBOutlet weak var ImageViewBottle: UIImageView!
    var image:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ImageViewBottle.image=image
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nextClicked(_ sender: AnyObject) {
        let value=UserDefaults.standard.string(forKey:"CustomType")
        if value == "KEG" {
            self.performSegue(withIdentifier:"goCustomKeg",sender: self)
        }
        if value == "BOTTLE" {
            self.performSegue(withIdentifier:"goCustomBottle",sender: self)
        }
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
