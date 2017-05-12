/*
Copyright (c) 2015 Kyohei Yamaguchi. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var btnTakeInventoryP: UIButton!
    @IBOutlet weak var btnPurchaseP: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btnTakeInventoryP.setImage(UIImage(named:"takeInventory"),for:UIControlState.normal)
        self.btnTakeInventoryP.setImage(UIImage(named:"takeInventory_selected"),for:UIControlState.highlighted)

        
        self.btnPurchaseP.setImage(UIImage(named:"purchase"),for:UIControlState.normal)
        self.btnPurchaseP.setImage(UIImage(named:"purchase_selected"),for:UIControlState.highlighted)
       
        
        
        
    }
    
   
    @IBAction func didTapOpen(_ sender: AnyObject) {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }

    }
    func didTapOpenButton(_ sender: UIBarButtonItem) {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
    }
    
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 



}*/
 
