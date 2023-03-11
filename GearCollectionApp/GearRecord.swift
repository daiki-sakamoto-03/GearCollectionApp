//
//  GearRecord.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/24.
//

import Foundation
import RealmSwift

class GearRecord: Object {
    override static func primaryKey() -> String {
        return "id"
    }
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var category: String = ""
    @objc dynamic var maker: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var amount: Int = 0
    @objc dynamic var weight: Double = 0.0
    @objc dynamic var date: Date = Date()
    @objc dynamic var imageURL: String = ""
    
}
