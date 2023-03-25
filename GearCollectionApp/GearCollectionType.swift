//
//  GearCollectionType.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/03/24.
//

enum CategoryGearType: Int {
    case all
    case tentAndTarp
    case tableAndChair
    case fire
    case kitchenAndTablewear
    case sleeping
    case other
    
    var gearTypeName: String {
        switch self {
        case .all:
            return "ALL"
        case .tentAndTarp:
            return "TENT&TARP"
        case .tableAndChair:
            return "TABLE&CHAIR"
        case .fire:
            return "FIRE"
        case .kitchenAndTablewear:
            return "KITCHEN&TABLEWEAR"
        case .sleeping:
            return "SLEEPING"
        case .other:
            return "OTHER"
        }
    }
}
