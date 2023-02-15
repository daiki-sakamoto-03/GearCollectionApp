//
//  GearTypeModel.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/14.
//

import Foundation


// カテゴリ分け
enum GearTypeModel: String, CaseIterable {
    case all = "ALL"
    case tentAndTarp = "TENT & TARP"
    case tableAndChair = "TABLE & CHAIR"
    case fire = "FIRE"
    case kitchenAndTablewear = "KITCHEN & TABLEWEAR"
    case sleeping = "SLEEPING"
    case other = "OTHER"
}
