//
//  MyInventoryTypeVC.swift
//  BarApp
//
//  Created by Apple on 5/16/17.
//  Copyright © 2017 KyrosTechnologies. All rights reserved.
//

import UIKit

class MyInventoryTypeVC: DefaultVC ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{

    var imageArray = [#imageLiteral(resourceName: "absinthe"),#imageLiteral(resourceName: "bitters"),#imageLiteral(resourceName: "bottledwater"),#imageLiteral(resourceName: "bourbon"),#imageLiteral(resourceName: "brandy"),#imageLiteral(resourceName: "champagne"),#imageLiteral(resourceName: "chinesewine"),#imageLiteral(resourceName: "desertwine"),#imageLiteral(resourceName: "gin"),#imageLiteral(resourceName: "japanesesake"),#imageLiteral(resourceName: "japaneseshochu"),#imageLiteral(resourceName: "juices"),#imageLiteral(resourceName: "koreansoju"),#imageLiteral(resourceName: "liquiers"),#imageLiteral(resourceName: "milk"),#imageLiteral(resourceName: "port"),#imageLiteral(resourceName: "redwine"),#imageLiteral(resourceName: "rose"),#imageLiteral(resourceName: "rum"),#imageLiteral(resourceName: "softdrinks"),#imageLiteral(resourceName: "sparkling wine"),#imageLiteral(resourceName: "syrup"),#imageLiteral(resourceName: "tequila"),#imageLiteral(resourceName: "vodka"),#imageLiteral(resourceName: "whiskey"),#imageLiteral(resourceName: "whisky"),#imageLiteral(resourceName: "whitewine")]
    var nameArray=["Absinthe","Bitters","Botteled Water","Bourbon","Brandy","Champagne","Chinese Wine","Desert Wine","Gin","Japanese Sake","Japanese Shochu","Juices","Korean Shochu","Liquries","Milk","Port","Red Wine","Rose","Rum","Soft Drinks","Sparkling Wine","Syrup","Tenquila","Vodka","Whiskey","Whisky","White Wine"]
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:InventoryTypeCell=collectionView.dequeueReusableCell(withReuseIdentifier: "inventoryTypeCell", for: indexPath as IndexPath) as! InventoryTypeCell
        
        cell.imgView.image=imageArray[indexPath.row]
        cell.name.text=nameArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.width/2.05, height: UIScreen.main.bounds.width/2.05)
    }
    @IBAction func backButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
