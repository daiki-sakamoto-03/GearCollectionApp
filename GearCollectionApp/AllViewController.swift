//
//  allViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/17.
//

import UIKit
import XLPagerTabStrip

class AllViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var allTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        return "ALL"
    }
    
    
}

// 登録したギアを表示するUITableViewのクラス
extension AllViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
