//
//  ViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    var gearDataList: [GearDataModel] = []
    var gearType: [GearType] = []
    
    var pageTabItemsWidth: CGFloat = 0.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // カテゴリ分け
    enum GearType: String {
        case all = "ALL"
        case tentAndTarp = "TENT & TARP"
        case tableAndChair = "TABLE & CHAIR"
        case fire = "FIRE"
        case kitchenAndTablewear = "KITCHEN & TABLEWEAR"
        case sleeping = "SLEEPING"
        case other = "OTHER"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // セルを登録する
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
    }
    
    func detGearData() {
        for i in 1...5 {
            let gearDataModel = GearDataModel(photo: <#T##URL#>)
            gearDataList.append(gearDataModel)
        }
    }

    
}


// セルを表示させる
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // セルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 * 3 // 表示したい要素数の3倍を返す
    }
    
    
    // セルの設定を行う為のメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    // 無限に横スクロール　（表示したい要素数の3倍を用意して、一定のスクロールを行うと中央に戻る）
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if pageTabItemsWidth == 0.0 {
            pageTabItemsWidth = floor(scrollView.contentSize.width / 3.0)
        }
        
        if (scrollView.contentOffset.x <= 0.0) || (scrollView.contentOffset.x > pageTabItemsWidth * 2.0) {
            scrollView.contentOffset.x = pageTabItemsWidth
        }
    }
    
}





extension ViewController: UITableViewDataSource {
    // UITableViewに表示するリストの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gearDataList.count
    }
    
    // UITableViewに表示するリストの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let gearDataModel: GearDataModel = gearDataList[indexPath.row]
        cell.textLabel?.text = gearDataModel.maker
        cell.textLabel?.text = gearDataModel.name

        return cell
    }
}
