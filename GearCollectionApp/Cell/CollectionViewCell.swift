//
//  CollectionViewCell.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/11.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .blue
    }
    

}
