//
//  allViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/17.
//

import UIKit
import XLPagerTabStrip

class allViewController: UIViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        return "all"
    }
    
    
}
