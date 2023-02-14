//
//  GearTypeModel.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/14.
//

import Foundation


// カテゴリ分け
enum GearTypeModel: String {
    case all = "ALL"
    case tentAndTarp = "TENT & TARP"
    case tableAndChair = "TABLE & CHAIR"
    case fire = "FIRE"
    case kitchenAndTablewear = "KITCHEN & TABLEWEAR"
    case sleeping = "SLEEPING"
    case other = "OTHER"
    
}

enum cellCount: Int {
    case firstCell = 0
    case secondCell = 1
    case thirdCell = 2
    case fourthCell = 3
    case fifthCell = 4
    case sixthCell = 5
    case seventhCell = 6
}

