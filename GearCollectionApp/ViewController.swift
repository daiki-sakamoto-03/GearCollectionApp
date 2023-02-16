//
//  ViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    var gearDataList: [GearDataModel] = []
    var gearType: [String] = []

    var pageTabItemsWidth: CGFloat = 0.0
    
    let collectionViewCell = CollectionViewCell()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // セルを登録する
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        GearTypeModel.allCases.forEach { GearTypeModel in
            gearType.append(GearTypeModel.rawValue)
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
        return gearType.count // 表示したい要素数
    }
    
    
    // セルの設定を行う為のメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell
        cell.label?.text = gearType[indexPath.row]
        return cell
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
