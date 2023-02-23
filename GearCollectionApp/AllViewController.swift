//
//  allViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/17.
//

import UIKit
import XLPagerTabStrip

class AllViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var allTableView: UITableView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    var gearDataList: [GearDataModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTableView.register(UINib(nibName: "AllTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        allTableView.rowHeight = 100 // tableViewの高さを100で固定
        setGearData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        return "ALL"
    }
    
    func setGearData() {
        for i in 1...5 {
            let gearDataModel = GearDataModel()
            gearDataList.append(gearDataModel)
        }
    }
    
}

// 登録したギアを表示するUITableViewのクラス
extension AllViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gearDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! AllTableViewCell
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gearDetailViewController = storyboard.instantiateViewController(identifier: "GearDetail") as! GearDetailViewController
        let gearData = gearDataList[indexPath.row]
        gearDetailViewController.configure(gear: gearData)
        
        cell.makerLabel?.text = "ZANEARTS"
        cell.nameLabel?.text = "GIGI1"
        cell.amountLabel?.text = "50,000"
        cell.weightLabel?.text = "4.5kg"
        return cell
    }
    
    
}
