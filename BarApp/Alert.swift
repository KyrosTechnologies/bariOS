//
//  Alert.swift
//  BarApp
//
//  Created by Abhinav on 5/19/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import Foundation
import UIKit

class Alert: NSObject {
    func showAlert(title:String,message:String)  {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
    
    }
}
