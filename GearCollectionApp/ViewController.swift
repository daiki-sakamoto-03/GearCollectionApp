//
//  ViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/08.
//

import UIKit
import XLPagerTabStrip

class ViewController: ButtonBarPagerTabStripViewController {
    
    var gearDataList: [GearDataModel] = []
    var gearType: [String] = []

    var pageTabItemsWidth: CGFloat = 0.0
    
    let collectionViewCell = CollectionViewCell()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // セルを登録する
        
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
        let allVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "All")
        let tentAndTarpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TentAndTarp")
        let tableAndChairVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableAndChair")
        let fireVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Fire")
        let kitchenAndTablewearVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KitchenAndTablewear")
        let sleepingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Sleeping")
        let otherVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Other")

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

