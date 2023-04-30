//
//  sleepingViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/18.
//

import UIKit
import XLPagerTabStrip

class SleepingViewController: UIViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        return "SLEEPING"
    }
    
    
}
