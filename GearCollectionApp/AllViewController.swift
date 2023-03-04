//
//  allViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/17.
//

import UIKit
import XLPagerTabStrip
import RealmSwift

class AllViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var allTableView: UITableView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    var gearDataList: [GearRecord] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTableView.register(UINib(nibName: "AllTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        allTableView.rowHeight = 100 // tableViewの高さを100で固定
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGearData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        return "ALL"
    }
    
    func setGearData() {
        let realm = try! Realm()
        let result = realm.objects(GearRecord.self)
        gearDataList = Array(result)
        }
}
    

// 登録したギアを表示するUITableViewのクラス
extension AllViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gearDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! AllTableViewCell
        let gearRecord: GearRecord = gearDataList[indexPath.row]
        // 各UILabelに、Realmに保存された内容を代入する
        cell.makerLabel.text = gearRecord.maker
        cell.nameLabel.text = gearRecord.name
        cell.amountLabel.text = "\(gearRecord.amount)"
        cell.weightLabel.text = "\(gearRecord.weight)"
        cell.dateLabel.text = "\(gearRecord.date)"
        return cell
    }
    // 削除機能追加
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let targetGear = gearDataList[indexPath.row]
        let realm = try! Realm()
        try! realm.write {
            realm.delete(targetGear)
        }
        gearDataList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
}
