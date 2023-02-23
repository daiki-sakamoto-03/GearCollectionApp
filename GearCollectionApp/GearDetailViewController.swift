//
//  GearDetailViewController.swift
//  GearCollectionApp
//
//  Created by 坂本　大貴 on 2023/02/23.
//

import UIKit

class GearDetailViewController: UIViewController {
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var makerText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gearDetailViewConntroller = storyboard.instantiateViewController(identifier: "GearDetail") as! GearDetailViewController
        navigationController?.pushViewController(gearDetailViewConntroller, animated: true)
    }
    
    
    var category: String = ""
    var maker: String = ""
    var name: String = ""
    var amount: Int = 0
    var weight: Double = 0.0
    var date: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    
    func configure(gear: GearDataModel) {
        category = gear.category
        maker = gear.maker
        name = gear.name
        amount = gear.amount
        weight = gear.weight
        date = gear.date
        print("データは\(category)、\(maker)、\(name)、\(amount)、\(weight)、\(date)です！")
    }
    
    func displayData() {
        categoryText.text = category
        makerText.text = maker
        nameText.text = name
        amountText.text = amount
        weightText.text = weight
        dateText.text = date
    }
    
}



