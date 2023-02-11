//
//  ViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // カテゴリ分け
    enum GearType: CaseIterable {
        case tentAndTarp
        case tableAndChair
        case fire
        case kitchenAndTablewear
        case sleeping
        case other
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // セルを登録する
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
    }
    
}


// セルを表示させる
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // セルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GearType.allCases.count
    }
    
    
    // セルの設定を行う為のメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
}
