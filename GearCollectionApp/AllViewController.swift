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
    
    let allTableViewCell = AllTableViewCell()
    var gearDataList: [GearRecord] = []
    var realm: Realm!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTableView.register(UINib(nibName: "AllTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        allTableView.rowHeight = 100 // tableViewの高さを100で固定

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGearData()
        allTableView.reloadData()
        totalIndicate()
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
    
    // Realmに保存されたデータを合計し、ギアの個数、総額、総重量を表示するメソッド
    func totalIndicate() {
        do {
            realm = try! Realm()
        } catch let error {
            print("エラー")
        }
        
        let objects = realm.objects(GearRecord.self)
        let amountSum = objects.sum(ofProperty: "amount")as Int
        let weightSum = objects.sum(ofProperty: "weight")as Double
        amountLabel.text = String(amountSum)
        weightLabel.text = String(weightSum)
        numberLabel.text = String(gearDataList.count)
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
        cell.amountLabel.text = "\(gearRecord.amount)円"
        cell.weightLabel.text = "\(gearRecord.weight)kg"
        cell.dateLabel.text = "\(gearRecord.date)"
        cell.img.image = loadImage(fileName: gearRecord.imageURL)
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
    
    
    func loadImage(fileName: String) -> UIImage? {
        guard gearDataList.isEmpty == false else {
            return nil
        }
        guard fileName.isEmpty == false else {
            return nil
        }
        let path = docURL("\(fileName).jpg")!.path
        if FileManager.default.fileExists(atPath: path) { // fileExists→ディレクトリがどうかチェックするメソッド(引数atPathで示した定数pathが存在する場合はtrue、存在しない場合はfalseを返す)
            if let image = UIImage(contentsOfFile: path) {
                return image
            } else {
                print("読み込みに失敗しました")
                return nil
            }
        } else {
            print("画像が見つかりませんでした")
            return nil
        }
    }
    
    private func docURL(_ fileName: String) -> URL? {
        do {
            let docsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            let url = docsURL.appendingPathComponent(fileName)
            return url
        } catch {
            return nil
        }
    }

    
}

