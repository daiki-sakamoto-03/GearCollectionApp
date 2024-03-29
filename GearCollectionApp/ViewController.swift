//
//  ViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/08.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {
        
    var pageTabItemsWidth: CGFloat = 0.0
    
    let collectionViewCell = CollectionViewCell()
    var addButtonItem = UIBarButtonItem()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // ギア追加ボタン
    @IBAction func addButton(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // バーの色
        settings.style.buttonBarBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        //ボタンの色
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 73/255, green: 72/255, blue: 62/255, alpha: 1)
        //セルの文字色
        settings.style.buttonBarItemTitleColor = UIColor.white
        //セレクトバーの色
        settings.style.selectedBarBackgroundColor = UIColor(red: 254/255, green: 0, blue: 124/255, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //管理されるViewControllerを返す処理
        let allVC = self.storyboard?.instantiateViewController(withIdentifier: "All") as! AllViewController
        allVC.gearType = .all
        
        let tentAndTarpVC = self.storyboard?.instantiateViewController(withIdentifier: "All") as! AllViewController
        tentAndTarpVC.gearType = .tentAndTarp
        
        let tableAndChairVC = self.storyboard?.instantiateViewController(withIdentifier: "All") as! AllViewController
        tableAndChairVC.gearType = .tableAndChair
        
        let fireVC = self.storyboard?.instantiateViewController(withIdentifier: "All") as! AllViewController
        fireVC.gearType = .fire
        
        let kitchenAndTablewearVC = self.storyboard?.instantiateViewController(withIdentifier: "All") as! AllViewController
        kitchenAndTablewearVC.gearType = .kitchenAndTablewear
        
        let sleepingVC = self.storyboard?.instantiateViewController(withIdentifier: "All") as! AllViewController
        sleepingVC.gearType = .sleeping
        
        let otherVC = self.storyboard?.instantiateViewController(withIdentifier: "All") as! AllViewController
        otherVC.gearType = .other
        
        let childViewControllers:[UIViewController] = [allVC,
                                                       tentAndTarpVC,
                                                       tableAndChairVC,
                                                       fireVC,
                                                       kitchenAndTablewearVC,
                                                       sleepingVC,
                                                       otherVC ]
        return childViewControllers
    }
}



