//
//  DrawerViewController.swift
//  BarApp
//
//  Created by Apple on 5/5/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class DrawerViewController: DefaultVC,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var menuTop: UIView!
    @IBOutlet weak var profilePicImgView: UIImageView!
    let nameArray=["Par List","Value on hand","Distributor List","Venue Summary","Profile","Settings","Logout"]
    let imageArray=["ParList","ValueOnHand","DistributorList","VenueSummary","Profile","Settings","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BottomView")!)
        self.menuTop.backgroundColor = UIColor(patternImage: UIImage(named: "TopView")!)


       // Do any additional setup after loading the view.

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.profilePicImgView.layer.masksToBounds = true
        self.profilePicImgView.layer.cornerRadius = self.profilePicImgView.frame.size.height/2
        // Hide the navigation bar on the this view controller
    }
    func didTapCloseButton(_ sender: UIButton) {
        if let drawerController = parent as? KYDrawerController {
            drawerController.setDrawerState(.closed, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DrawerCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! DrawerCell
        
        cell.label.text=nameArray[indexPath.row]
        cell.icon.image=UIImage(named:imageArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            self.performSegue(withIdentifier: "goProfile", sender: self)
            
        }
        if indexPath.row == 5{
            self.performSegue(withIdentifier: "goSettings", sender: self)
        }
        if indexPath.row == 6{
            let controller:UIAlertController = UIAlertController(title:"Logout",message:"Are you sure want to logout?",preferredStyle:.alert)
            controller.addAction(UIAlertAction(title:"NO",style:.cancel){ action in
                
            });
            controller.addAction(UIAlertAction(title:"YES",style:.default){ action in
                let story = UIStoryboard(name:"Main",bundle:nil)
                let loginVC = story.instantiateViewController(withIdentifier: "Login")
                self.present(loginVC, animated: true, completion: nil)
            });
            self.present(controller, animated:true, completion:nil)
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
