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
        let cell = UITableViewCell()
        // indexPath.row → UITableViewに表示されるCellの（０から始まる）通り番号が順番に渡される
        let gearDataModel: GearDataModel = gearDataList[indexPath.row]
        cell.textLabel?.text = gearDataModel.maker
        cell.textLabel?.text = gearDataModel.name
        
        return UITableViewCell()
    }
    
    
}
